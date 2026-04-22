# ── PYTHON ──────────────────────────────────────────────────────────

# Basic lambda
square = lambda x: x ** 2
print(square(5))                        # 25

# Multiple parameters
add = lambda x, y: x + y
print(add(3, 4))                        # 7

# Used inline with built-ins
nums = [1, 2, 3, 4, 5]
evens    = list(filter(lambda x: x % 2 == 0, nums))
doubled  = list(map(lambda x: x * 2,         nums))
print(evens)                            # [2, 4]
print(doubled)                          # [2, 4, 6, 8, 10]

# Returning a lambda from a function
def multiplier(n):
    return lambda x: x * n

triple = multiplier(3)
print(triple(7))                        # 21