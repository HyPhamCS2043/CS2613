#Author: Hy Pham
#Student ID: 364417

#Node class for double linked list implementation
class Node:
    def __init__(self, data):
        self.next = None
        self.prev = None
        self.data = data


class DoubleLinkedList:
    def __init__(self):
        self.head = None
        self.tail = None
        self.length = 0

    def insert_end(self, dataIn):
        newNode = Node(dataIn)
        if self.length == 0:
            self.head = newNode
            self.tail = newNode
            
        else:
            newNode.prev = self.tail
            self.tail.next = newNode
            self.tail = newNode  

        self.length += 1
    