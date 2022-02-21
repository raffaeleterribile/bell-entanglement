namespace BellEntanglement {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    

    operation Set(desired: Result, qubit: Qubit) : Unit {
        if (desired != M(qubit)) {
            X(qubit);
        }
    }

    operation TestBellStateBase(count: Int, initial: Result) : (Int, Int) {
        mutable numOnes = 0;

        using(qubit = Qubit()) {
            for (test in 1..count) {
                Set(initial, qubit);

                //X(qubit);     Inverte il Qubit
                //H(qubit);     Lo pone in una Superposizione a metà fra |0> ed |1>
                let result = M(qubit);

                // Count the number of ones we saw:
                if (result == One) {
                    set numOnes += 1;
                }
            }

            Set(Zero, qubit);
        }

        // Return number of times we saw a |0> and number of times we saw a |1>
        return (count - numOnes, numOnes);
    }

    operation TestBellStateInverse(count: Int, initial: Result) : (Int, Int) {
        mutable numOnes = 0;

        using(qubit = Qubit()) {
            for (test in 1..count) {
                Set(initial, qubit);

                X(qubit);     // Inverte il Qubit
                let result = M(qubit);

                // Count the number of ones we saw:
                if (result == One) {
                    set numOnes += 1;
                }
            }

            Set(Zero, qubit);
        }

        // Return number of times we saw a |0> and number of times we saw a |1>
        return (count - numOnes, numOnes);
    }

    operation TestBellStateRandom(count: Int, initial: Result) : (Int, Int) {
        mutable numOnes = 0;

        using(qubit = Qubit()) {
            for (test in 1..count) {
                Set(initial, qubit);

                H(qubit);     // Lo pone in una Superposizione a metà fra |0> ed |1>
                let result = M(qubit);

                // Count the number of ones we saw:
                if (result == One) {
                    set numOnes += 1;
                }
            }

            Set(Zero, qubit);
        }

        // Return number of times we saw a |0> and number of times we saw a |1>
        return (count - numOnes, numOnes);
    }

    @EntryPoint()
    operation TestBellState(count: Int, initial: Result) : (Int, Int, Int) {
        mutable numOnes = 0;
        mutable agree = 0;

        using((qubit0, qubit1) = (Qubit(), Qubit())) {
            for (test in 1..count) {
                Set(initial, qubit0);
                Set(Zero, qubit1);

                H(qubit0);
                CNOT(qubit0, qubit1); // Crea l'Entanglement fra i due Qubit

                let result = M(qubit0);

                if (result == M(qubit1)) {
                    set agree += 1;
                }

                // Count the number of ones we saw:
                if (result == One) {
                    set numOnes += 1;
                }
            }

            Set(Zero, qubit0);
            Set(Zero, qubit1);
        }

        // Return number of times we saw a |0> and number of times we saw a |1>
        return (count - numOnes, numOnes, agree);
    }
}
