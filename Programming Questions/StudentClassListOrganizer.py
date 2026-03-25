#Author: Hy Pham
#Student ID: 364417

#Student Object
class Student:
    def __init__(self, name, studentID):
        self._name = name
        self._studentID = studentID
    
    @property
    def name(self):
        return self._name
    
    @property
    def studentID(self):
        return self._studentID
    
    @name.setter
    def name(self, nameIn):
        self._name = nameIn

    @studentID.setter
    def studentID(self, stuID):
        self._studentID = stuID

#Node class for double linked list implementation
class Node:
    def __init__(self, data):
        self._next = None
        self._prev = None
        self._data = data
    
    @property
    def next(self):
        return self._next
    
    @property
    def prev(self):
        return self._prev
    
    @property
    def data(self):
        return self._data
    
    @next.setter
    def next(self, node):
        self._next = node

    @prev.setter
    def prev(self, node):
        self._prev = node

    @data.setter
    def data(self, dataIn):
        self._data = dataIn

#Class for double linked list
class DoubleLinkedList:
    def __init__(self):
        self._headhead = None
        self._tail = None
        self._length = 0

    @property
    def head(self):
        return self._head

    @property
    def tail(self):
        return self._tail
    
    @property
    def length(self):
        return self._length
    
    @head.setter
    def head(self, node):
        self._head = node
    
    @tail.setter
    def tail(self, node):
        self._tail = node
    
    @length.setter
    def length(self, num):
        self._length = num

    def insert_end(self, dataIn):
        newNode = Node(dataIn)
        if self._length == 0:
            self._head = newNode
            self._tail = newNode
            
        else:
            self._tail.next = newNode
            newNode.prev = self._tail
            self._tail = newNode  

        self._length += 1
    

#Class for a Course (double linbked list)
class Course(DoubleLinkedList):
    def __init__(self, courseName, capacity):
        super().__init__()
        self._courseName = courseName
        self._capacity = capacity

    def num_students(self):
        return self.length
    
    def add_students(self, student):
        if self.length >= self._capacity:
            print("Cannot add student to the course. The course is at max capacity.")
        elif self.length == 0:
            super().insert_end(student)
            print("Student is successfully added to the course.")
        else:
            current = self.head
            currentID = current.data.studentID
            stuToAdd = Node(student)
            inserted = False

            #while the current node student ID is less than new student ID
            while currentID <= student.studentID:
                #If it is the last node, then add new student node to the end of list
                if current == self.tail:
                    self.insert_end(student)
                    inserted = True
                    break
                
                current = current.next
                currentID = current.data.studentID
            
            if not inserted:
                stuToAdd.prev = current.prev
                stuToAdd.next = current

                if current.prev:
                    current.prev.next = stuToAdd
                current.prev = stuToAdd
                inserted = True
                self.length += 1
            
            if inserted:
                print("Student is successfully added to the course.")

    def print_ascend(self):
        stringOut = ""
        current = self.head
        while current:
            stringOut = stringOut + current.data.name + " " + str(current.data.studentID) + "\n"
            current = current.next
        print(stringOut)
    
    def print_descend(self):
        stringOut = ""
        current = self.tail
        while current:
            stringOut = stringOut + current.data.name + " " + str(current.data.studentID) + "\n"
            current = current.prev
        print(stringOut)

student1 = Student("Austin", 1)
student2 = Student("Avery", 5)
student3 = Student("Jessie", 3)


#print(student1.name)

#linked = DoubleLinkedList()
#print(linked.length)
#linked.insert_end(student1)
#print(linked.length)
#print(linked.head.data.studentID)
#linked.insert_end(student2)

#print(linked.tail.data.name)
#print(linked.length)

course1 = Course("CS2053", 3)
print(course1.num_students())

course1.add_students(student1)
course1.add_students(student2)

print(course1.head.data.name)
print(course1.tail.data.name)

course1.add_students(student3)

print("After adding 3 students")
print(course1.num_students())
print(course1.head.data.name)
print(course1.tail.data.name)
print("Ascending List: ")
course1.print_ascend()
print("Descending List: ")
course1.print_descend()     