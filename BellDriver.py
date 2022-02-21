import qsharp

from qsharp import Result
from BellEntanglement import TestBellState
# from BellEntanglement import TestBellStateBase, TestBellStateInverse, TestBellStateRandom, TestBellState

initials = (Result.Zero, Result.One)

# for i in initials:
# 	result = TestBellStateBase.simulate(count = 1000, initial = i)
# 	(num_zeros, num_ones) = result
# 	print(f"Init: {i: <4} zeros = {num_zeros: <4} ones = {num_ones: <4}")


# for i in initials:
# 	result = TestBellStateInverse.simulate(count = 1000, initial = i)
# 	(num_zeros, num_ones) = result
# 	print(f"Init: {i: <4} zeros = {num_zeros: <4} ones = {num_ones: <4}")

# for i in initials:
# 	result = TestBellStateRandom.simulate(count = 1000, initial = i)
# 	(num_zeros, num_ones) = result
# 	print(f"Init: {i: <4} zeros = {num_zeros: <4} ones = {num_ones: <4}")

for i in initials:
	result = TestBellState.simulate(count = 1000, initial = i)
	(num_zeros, num_ones, num_agrees) = result
	print(f"Init: {i: <4} zeros = {num_zeros: <4} ones = {num_ones: <4} agrees = {num_agrees: <4}")
