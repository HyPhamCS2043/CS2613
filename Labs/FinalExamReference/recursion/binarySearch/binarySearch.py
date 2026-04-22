# Python
def binary_search(lst, target, lo, hi):
    if lo > hi: return -1
    mid = (lo + hi) // 2
    if lst[mid] == target: return mid
    if lst[mid]  < target: return binary_search(lst, target, mid + 1, hi)
    return binary_search(lst, target, lo, mid - 1)

lst = [1, 3, 5, 7, 9, 11]
print(binary_search(lst, 7, 0, len(lst) - 1))  # 3