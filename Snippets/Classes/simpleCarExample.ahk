; https://autohotkey.com/board/topic/68877-practical-oop-advantage-showing-example-is-needed/

#SingleInstance, force
#Persistent

FrankiesCar := new Car("Frankie", "Mitshubishi", "Lancer", "White")   ; creates object (car class)
JillsCar := new Car("Jill", "Renault", "Laguna", "Black")         ; creates object (car class)

FrankiesCar.Accelerate(200)      ; call method
JillsCar.Brake()            ; call method

MsgBox % JillsCar.Color      ; get property
JillsCar.Color := "Yellow"   ; set property - Jill repainted her car from Black to Yellow
MsgBox % JillsCar.Color      ; get property


Class Car {      ; defines object (car class), its methods and properties
   static  Wheels := 4   ; constant property
   __New(Owner, Manufacturer, Model, Color) {   ; method which is called when new object (car class) is created
      this.Owner := Owner, this.Manufacturer := Manufacturer, this.Model := Model, this.Color := Color   ; properties
   }
   Accelerate(speed) {   ; method
      MsgBox, % this.Owner "'s " this.Manufacturer A_Space this.Model " will accelerate to " Speed " km/h"
   }
   Brake() {   ; method
      MsgBox, % this.Owner "'s " this.Manufacturer A_Space this.Model " will break now"
   }
}

~^s::reload