# Python
def flatten(lst):
    if not lst: return []
    if isinstance(lst[0], list):
        return flatten(lst[0]) + flatten(lst[1:])
    return [lst[0]] + flatten(lst[1:])

print(flatten([1, [2, [3, 4]], 5]))     # [1, 2, 3, 4, 5]