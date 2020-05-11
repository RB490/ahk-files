; https://autohotkey.com/board/topic/68877-practical-oop-advantage-showing-example-is-needed/

#SingleInstance, force
#Persistent

MyFactory := new WarFactory("China")      ; let's build a war factory in China
MsgBox % MyFactory.Description

Tank := MyFactory.BuildTank("gray")               ; let's build a tank in our factory
HeavyTank := MyFactory.BuildTank("black","heavy")   ; let's build heavy armored tank in our factory
WeakTank := MyFactory.BuildTank("white","weak")      ; tank can't have weak armor. Production will fail.

MsgBox % MyFactory.TotalVehiclesProduced         ; so just 2 (not 3) vehicles are successfully produced


Loop, 11                  ; Tank initialy has 10 shells. It' cant fire 11 times without reloading shells.
Tank.Attack("enemy bunker")

Tank.ReloadShells(3)         ; ok, let's reload shells
Tank.Attack("enemy bunker")      ; it can fire again


Truck := MyFactory.BuildTruck("green",12)   ; let's build a truck in our factory that can take up to 12 tons of cargo.
Truck.LoadCargo(10)                     ; let's load 10 tons of cargo in it.
Truck.LoadCargo(5)                     ; let's try to load 5 tons more. Can we? No - it's over capacity, but we'll load what we can.
;MsgBox % Truck.CurrentLoad


MyFactory.Sell()                     ; let's sell factory.
AnotherTank := MyFactory.BuildTank("gray")   ; You are not factory owner any more, so it can't produce vehicles for you any more.




Class WarFactory {
   static Description := "A war factory is the primary vehicle construction building."   ; constant property
   
   __New(Location) {
      this.Location := Location
      this.TotalVehiclesProduced := 0
   }
   
   ;=== Methods ===
   BuildTank(Color, ArmorStrenght="medium") {
      if this.IsSold
      {
         MsgBox, 16,, You sold this factory.`nIt can't produce vehicles for you any more!
         return
      }
      NewVehicle := new this.Tank(Color, ArmorStrenght)
      if NewVehicle
      {
         this.TotalVehiclesProduced += 1
         return NewVehicle
      }
   }
   
   BuildTruck(Color, MaxLoad=10) {
      if this.IsSold
      {
         MsgBox, 16,, You sold this factory.`nIt can't produce vehicles for you any more!
         return
      }
      NewVehicle := new this.Truck(Color, MaxLoad)
      if NewVehicle
      {
         this.TotalVehiclesProduced += 1
         return NewVehicle
      }
   }
   
   Sell() {
      this.IsSold := 1
   }
   
   
   ;=== Nested classes ===
   Class Tank {
      static Description := "Tank is a armored tracked battle vehicle."   ; constant property
      static MaxShells := 10   ; constant property
      __New(Color, ArmorStrenght=0) {
         
         if ArmorStrenght not in medium,heavy
         {
            MsgBox, 16,, Tank can't have %ArmorStrenght% armor, only medium or heavy.`nTank production failed!
            return
         }
         this.Color := Color, this.ArmorStrenght := ArmorStrenght     ; properties
         this.Shells := this.MaxShells   ; property. New tanks are battle ready, and fully loaded with shells.
      }
      
      ;=== Methods ===
      Attack(what) {
         if (this.Shells <= 0)
         {
            MsgBox, 16,, % "Your " this.ArmorStrenght " armored " this.Color " tank has no more shells!"
            return
         }
         MsgBox, % "Your " this.ArmorStrenght " armored " this.Color " tank has " this.Shells " shells left and will fire at " what " now."
         this.Shells -= 1
      }
      ReloadShells(HowMany=10) {
         CapacityLeft := this.MaxShells - this.Shells
         if (HowMany > CapacityLeft)
         HowMany := CapacityLeft
         this.Shells := HowMany
      }
      
   }
   
   Class Truck {
      static Description := "Truck is a vehicle designed to transport cargo."   ; constant property
         
      __New(Color, MaxLoad=10) {
         if MaxLoad not between 5 and 15
         {
            MsgBox, 16,, Trucks can have 5-15 tons of maximum load, not %MaxLoad%.`nTruck production failed!
            return
         }
         this.Color := Color, this.MaxLoad := MaxLoad     ; properties
         this.CurrentLoad := 0      ; property. New trucks are not loaded with cargo.
      }
      
      ;=== Methods ===
      LoadCargo(HowManyTons) {
         CapacityLeft := this.MaxLoad - this.CurrentLoad
         if (HowManyTons > CapacityLeft)
         {
            HowManyTons := CapacityLeft
            MsgBox, % "We can't load more than " HowManyTons " tons of cargo in your " this.Color " truck. OK?"
         }
         this.CurrentLoad += HowManyTons
      }
   }
}

~^s::reload