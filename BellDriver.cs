using System;

using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace BellEntanglement {
	class BellDriver {
		static void Main(string[] args) {
			TestBellStateBase();
			TestBellStateInverse();
			TestBellStateRandom();
			TestBellState();

			System.Console.WriteLine("Press any key to continue...");
			//System.Console.ReadKey();
		}

		private static void TestBellStateBase() {
			using(var simulator = new QuantumSimulator()) {
				// Try initial values
				Result[] initials = new Result[] {Result.Zero, Result.One};

				foreach (Result initial in initials) {
					var result = BellEntanglement.TestBellStateBase.Run(simulator, 1000, initial).Result;
					var (numZeros, numOnes) = result;
					System.Console.WriteLine($"Init:{initial, -4} zeros = {numZeros, -4} ones = {numOnes, -4}");
				}
			}
		}

		private static void TestBellStateInverse() {
			using(var simulator = new QuantumSimulator()) {
				// Try initial values
				Result[] initials = new Result[] {Result.Zero, Result.One};

				foreach (Result initial in initials) {
					var result = BellEntanglement.TestBellStateInverse.Run(simulator, 1000, initial).Result;
					var (numZeros, numOnes) = result;
					System.Console.WriteLine($"Init:{initial, -4} zeros = {numZeros, -4} ones = {numOnes, -4}");
				}
			}
		}

		private static void TestBellStateRandom() {
			using(var simulator = new QuantumSimulator()) {
				// Try initial values
				Result[] initials = new Result[] {Result.Zero, Result.One};

				foreach (Result initial in initials) {
					var result = BellEntanglement.TestBellStateRandom.Run(simulator, 1000, initial).Result;
					var (numZeros, numOnes) = result;
					System.Console.WriteLine($"Init:{initial, -4} zeros = {numZeros, -4} ones = {numOnes, -4}");
				}
			}
		}

		private static void TestBellState() {
			using(var simulator = new QuantumSimulator()) {
				// Try initial values
				Result[] initials = new Result[] {Result.Zero, Result.One};

				foreach (Result initial in initials) {
					var result = BellEntanglement.TestBellState.Run(simulator, 1000, initial).Result;
					var (numZeros, numOnes, numAgrees) = result;
					System.Console.WriteLine($"Init:{initial, -4} zeros = {numZeros, -4} ones = {numOnes, -4} agrees = {numAgrees, -4}");
				}
			}
		}
	}
}