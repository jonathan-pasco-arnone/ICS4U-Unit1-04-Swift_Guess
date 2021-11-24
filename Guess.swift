//
//  Created by Jonathan Pasco-Arnone
//  Created on 2021-11-19
//  Version 1.0
//  Copyright (c) 2021 MTHS. All rights reserved.
//
//  This program calculates the amount of time to reheat a
//  specific quantity of a specific type of food.

// Constants.
let minGuessValue: Int = 1
let maxGuessValue: Int = 6
let extra: Int = 1

// Making an error case.
enum MyError: Error {
    case invalidInteger(String)
}

func calculatePrice() throws {

    // Random number generator.
    let randomNumber = Int.random(in: 1..<6+1)
    var runOnce = 0
    print(randomNumber)

    // Inputs.
    print("Guess the random number from 1 to 6: ")
    var guess = readLine()

    if let firstGuessInt = Int(guess!) {
        while firstGuessInt != randomNumber || runOnce == 0 {

            if let otherGuessInt = Int(guess!) {
                // This is to insure the while loop runs at least once.
                runOnce = 1
                if otherGuessInt < minGuessValue || otherGuessInt > maxGuessValue {
                    print("Your guess won't count. Guess again.")
                } else if otherGuessInt < randomNumber {
                    print("Your guessed too low. Guess again.")
                } else if otherGuessInt > randomNumber {
                    print("Your guessed too high. Guess again.")
                } else if otherGuessInt == randomNumber {
                    print("You Guessed Correctly!")
                    break
                } else {
                    /* This throws an error out of the called function
                    and activates the catch statement.
                    */
                    throw MyError.invalidInteger("Error")
                }
            } else {
                /* This throws an error out of the called function
                and activates the catch statement.
                */
                throw MyError.invalidInteger("Error")
            }

            // Inputs.
            print("Guess the random number from 1 to 6: ")
            guess = readLine()

        }

    } else {

    /* This throws an error out of the called function
    and activates the catch statement.
    */
    throw MyError.invalidInteger("Error")

    }
}

do {
    // Calls the function to be tested for errors.
    try calculatePrice()
} catch {
    print("That was an invalid input")
}
print("\nDone.")
