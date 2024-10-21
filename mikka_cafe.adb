with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Latin_1; use Ada.Characters.Latin_1;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;


procedure Mikka_Cafe is

   ----GLOBAL VARIABLES---

   Number_Of_Producers: constant Integer := 5;
   Number_Of_Assemblies: constant Integer := 3;
   Number_Of_Consumers: constant Integer := 2;

   subtype Producer_Type is Integer range 1 .. Number_Of_Producers;
   subtype Assembly_Type is Integer range 1 .. Number_Of_Assemblies;
   subtype Consumer_Type is Integer range 1 .. Number_Of_Consumers;


   --each Producer is assigned a Product that it produces
   Product_Name: constant array (Producer_Type) of String( 1 .. 6 )
     := ("  Cup ", "Coffee", " Milk ", " Sugar", " Cake ");
   --Assembly is a collection of products
   Assembly_Name: constant array (Assembly_Type) of String(1 .. 21)
     := ("     Black coffee    ", "Sweetened  cappuccino", "Black coffee and cake");


   ----TASK DECLARATIONS----

   -- Producer produces determined product
   task type Producer is
      entry Start(Product: in Producer_Type; Production_Time: in Integer);
   end Producer;

   -- Consumer gets an arbitrary assembly of several products from the buffer
   -- but he/she orders it randomly
   task type Consumer is
      entry Start(Consumer_Number: in Consumer_Type;
                  Consumption_Time: in Integer);
   end Consumer;

   -- Buffer receives products from Producers and delivers Assemblies to Consumers
   task type Buffer is
      -- Accept a product to the storage (provided there is a room for it)
      entry Take(Product: in Producer_Type; Number: in Integer);
      -- Deliver an assembly (provided there are enough products for it)
      entry Deliver(Assembly: in Assembly_Type; Number: out Integer);
   end Buffer;

   P: array ( 1 .. Number_Of_Producers ) of Producer;
   K: array ( 1 .. Number_Of_Consumers ) of Consumer;
   B: Buffer;


   ----TASK DEFINITIONS----

   --Producer--

   task body Producer is
      subtype Production_Time_Range is Integer range 1 .. 3;
      package Random_Production is new Ada.Numerics.Discrete_Random(Production_Time_Range);
      --  random number generator
      G: Random_Production.Generator;
      Producer_Type_Number: Integer;
      Product_Number: Integer;
      Production: Integer;
      Random_Time: Duration;
      Success: Boolean;
   begin
      accept Start(Product: in Producer_Type; Production_Time: in Integer) do
         --  start random number generator
         Random_Production.Reset(G);
         Product_Number := 1;
         Producer_Type_Number := Product;
         Production := Production_Time;
      end Start;

      Put_Line(ESC & "[93m" & "P: Started producing " & Product_Name(Producer_Type_Number) & ESC & "[0m");

      loop
         Random_Time := Duration(Random_Production.Random(G));

         delay Random_Time;

         Put_Line(ESC & "[93m" & "P: Produced product " & Product_Name(Producer_Type_Number)
                  & " number "  & Integer'Image(Product_Number) & ESC & "[0m");

         Success := False;

         -- Accept for storage/abort if buffor full to prevent deadlock
         select 
            B.Take(Producer_Type_Number, Product_Number);
            Success := True;
            begin
               Product_Number := Product_Number + 1;
            exception
               when Constraint_Error =>
                  Put_Line(ESC & "[91m" & "ERROR : Constraint Exception in Producer task, reverting to a default value" & ESC & "[0m");
                  Product_Number := 1;
            end;
         or
            delay 2.0;

            if not Success then --if product not taken by buffor
               Put_Line(ESC & "[93m" & "P: Failed to store product! " & Product_Name(Producer_Type_Number) & ESC & "[0m");
            end if;

         end select;
      end loop;
   exception
      when others =>
         Put_Line(ESC & "[91m" & "ERROR : Exception in Producer task" & ESC & "[0m");
   end Producer;


   --Consumer--

   task body Consumer is
      subtype Consumption_Time_Range is Integer range 4 .. 8;
      package Random_Consumption is new
        Ada.Numerics.Discrete_Random(Consumption_Time_Range);

      --each Consumer takes any (random) Assembly from the Buffer
      package Random_Assembly is new
        Ada.Numerics.Discrete_Random(Assembly_Type);

      G: Random_Consumption.Generator;
      GA: Random_Assembly.Generator;
      Consumer_Nb: Consumer_Type;
      Assembly_Number: Integer;
      Consumption: Integer;
      Assembly_Type: Integer;
      Consumer_Name: constant array (1 .. Number_Of_Consumers)
        of String(1 .. 7)
        := ("Client1", "Client2");
   begin
      accept Start(Consumer_Number: in Consumer_Type;
                   Consumption_Time: in Integer) do
         Random_Consumption.Reset(G);
         Random_Assembly.Reset(GA);
         Consumer_Nb := Consumer_Number;
         Consumption := Consumption_Time;
      end Start;

      Put_Line(ESC & "[96m" & "C: Started consuming " & Consumer_Name(Consumer_Nb) & ESC & "[0m");

      loop

         delay Duration(Random_Consumption.Random(G)); --  simulate consumption
         Assembly_Type := Random_Assembly.Random(GA);

         -- retry taking an assembly for consumption
         loop
            select
               B.Deliver(Assembly_Type, Assembly_Number);

               if Assembly_Number > 0 then --handle so that client doesnt take assembly number 0

                  Put_Line(ESC & "[96m" & "C: " & Consumer_Name(Consumer_Nb) & " takes set " &
                             Assembly_Name(Assembly_Type) & " number " &
                             Integer'Image(Assembly_Number) & ESC & "[0m");

                  exit; -- exit loop once valid set is delivered
               else
                  Put_Line(ESC & "[96m" & "C: " & Consumer_Name(Consumer_Nb) & " cannot take set number 0!" & ESC & "[0m");
               end if;
            then abort --if consumer takes too long to get assembly
               delay 2.0;
               Put_Line(ESC & "[96m" & "C: " & Consumer_Name(Consumer_Nb) & " timeout! cannot take set " &
                          Assembly_Name(Assembly_Type) & " number " &
                          Integer'Image(Assembly_Number) & ESC & "[0m");
            end select;
         end loop;
      end loop;
   exception
      when Constraint_Error =>
         Put_Line(ESC & "[91m" & "ERROR : Constraint Exception in Consumer task" & ESC & "[0m");
      when others =>
         Put_Line(ESC & "[91m" & "ERROR : Exception in Consumer task" & ESC & "[0m");
   end Consumer;


   --Buffer--

   task body Buffer is
      Storage_Capacity: constant Integer := 30;
      type Storage_type is array (Producer_Type) of Integer;
      Storage: Storage_type
        := (0, 0, 0, 0, 0);
      Assembly_Content: array(Assembly_Type, Producer_Type) of Integer
        := ((1, 1, 0, 0, 0),
            (1, 1, 1, 1, 0),
            (1, 1, 0, 0, 1));
      Max_Assembly_Content: array(Producer_Type) of Integer;
      Assembly_Number: array(Assembly_Type) of Integer
        := (1, 1, 1);
      In_Storage: Integer := 0;

      procedure Setup_Variables is
      begin
         for W in Producer_Type loop
            Max_Assembly_Content(W) := 0;
            for Z in Assembly_Type loop
               if Assembly_Content(Z, W) > Max_Assembly_Content(W) then
                  Max_Assembly_Content(W) := Assembly_Content(Z, W);
               end if;
            end loop;
         end loop;
      end Setup_Variables;

      function Can_Accept(Product: Producer_Type) return Boolean is
      begin
         if In_Storage >= Storage_Capacity then
            return False;
         else
            if Storage(Product) < 6 then
               return True;
            end if;
            Put_Line(ESC & "[91m" & "B: Too much of product " & Product_Name(Product) & ESC & "[0m");
            return False;
         end if;
      end Can_Accept;

      function Can_Deliver(Assembly: Assembly_Type) return Boolean is
      begin
         for W in Producer_Type loop
            if Storage(W) < Assembly_Content(Assembly, W) then
               return False;
            end if;
         end loop;
         return True;
      end Can_Deliver;

      procedure Storage_Contents is
      begin
         for W in Producer_Type loop
            Put_Line("|   Cafe contents: " & Integer'Image(Storage(W)) & " "
                     & Product_Name(W));
         end loop;
         Put_Line("|   Number of products in cafe: " & Integer'Image(In_Storage));

      end Storage_Contents;

   begin
      Put_Line(ESC & "[91m" & "B: Buffer started" & ESC & "[0m");
      Setup_Variables;
      loop
         accept Take(Product: in Producer_Type; Number: in Integer) do
            if Can_Accept(Product) then
               Put_Line(ESC & "[91m" & "B: Accepted product " & Product_Name(Product) & " number " &
                          Integer'Image(Number)& ESC & "[0m");
               Storage(Product) := Storage(Product) + 1;
               In_Storage := In_Storage + 1;
            else
               Put_Line(ESC & "[91m" & "B: Rejected product " & Product_Name(Product) & " number " &
                          Integer'Image(Number)& ESC & "[0m");
            end if;
         end Take;
         Storage_Contents;

         accept Deliver(Assembly: in Assembly_Type; Number: out Integer) do
            if Can_Deliver(Assembly) then
               Put_Line(ESC & "[91m" & "B: Delivered set " & Assembly_Name(Assembly) & " number " &
                          Integer'Image(Assembly_Number(Assembly))& ESC & "[0m");
               for W in Producer_Type loop
                  Storage(W) := Storage(W) - Assembly_Content(Assembly, W);
                  In_Storage := In_Storage - Assembly_Content(Assembly, W);
               end loop;
               Number := Assembly_Number(Assembly);
               begin
                  Assembly_Number(Assembly) := Assembly_Number(Assembly) + 1;
               exception
                  when Constraint_Error =>
                     Assembly_Number(Assembly) := 0;
               end;
            else
               Put_Line(ESC & "[91m" & "B: Lacking products for set " & Assembly_Name(Assembly)& ESC & "[0m");
               Number := 0;
            end if;
         end Deliver;
         Storage_Contents;

      end loop;
   exception
      when Constraint_Error =>
         Put_Line(ESC & "[91m" & "ERROR : Constraint Exception in Buffer task" & ESC & "[0m");
      when others =>
         Put_Line(ESC & "[91m" & "ERROR : Exception in Buffer task" & ESC & "[0m");
   end Buffer;



   ---"MAIN" FOR SIMULATION---
begin
   for I in 1 .. Number_Of_Producers loop
      P(I).Start(I, 10);
   end loop;
   for J in 1 .. Number_Of_Consumers loop
      K(J).Start(J,12);
   end loop;
exception
   when Tasking_Error =>
      Put_Line(ESC & "[91m" & "ERROR : Problem with tasking in procedure Mikka_Cafe" & ESC & "[0m");
   when Constraint_Error =>
      Put_Line(ESC & "[91m" & "ERROR : Constraint error in procedure Mikka_Cafe" & ESC & "[0m");
   when others =>
      Put_Line(ESC & "[91m" & "ERROR : Unknown error in procedure Mikka_Cafe" & ESC & "[0m");
end Mikka_Cafe;