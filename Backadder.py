class Backadder:

  first = None # Node
  last  = None # Node

  def __repr__(self):
    return "<Backadder %s>" % (self.first)

class Node:

  prev = None # Node
  item = None # Number
  next = None # Node

  def __repr__(self):
    return "<Node %s %s>" % (self.item, self.next)

def addToBack(newItem, backadder):
  last = findLastInBackadder(backadder)
  node = Node()
  node.item = newItem
  node.prev = last
  last.next = node
  backadder.last = node
  return backadder

def removeFromBack(backadder):
  last = findLastInBackadder(backadder)
  last.prev.next = None
  backadder.last = last.prev
  return backadder

def findLastInBackadder(backadder):
  return backadder.last

def removeFromBackSlow(backadder):
  last = findLastInBackadderSlow(backadder)
  last.prev.next = None
  return backadder

def addToBackSlow(newItem, backadder):
  last = findLastInBackadder(backadder)
  node = Node()
  node.item = newItem
  node.prev = last
  last.next = node
  return backadder

def findLastInBackadderSlow(backadder):
  item = backadder.first
  while (item.next != None):
    item = item.next
  return item


## Add to the front and remove from the front

def addToFront(newItem, backadder):
  first = findFirstInBackadder(backadder)
  node = Node()
  node.item = newItem
  node.next = first
  first.prev = node
  backadder.first = node
  return backadder

def removeFromFront (backadder):
  first = findFirstInBackadder (backadder)
  first.next.prev = None
  backadder.first = first.next
  return backadder
    
def findFirstInBackadder(backadder):
  return backadder.first


## Queue thing 

class Queue: 
  first = None 
  last = None

  def __repr__(self):
    return "<Queue %s>" % (self.first)

class Node:

  prev = None # Node
  item = None # Number
  next = None # Node

  def __repr__(self):
    return "<Node %s %s>" % (self.item, self.next)

def enqueue (newItem, queue):
  last = findLastInQueue(queue)
  node = Node()
  node.item = newItem
  node.prev = last
  last.next = node
  queue.last = node
  return queue 

def findLastInQueue (queue):
  return queue.last

def dequeue (queue):
  first = findFirstInQueue (queue)
  first.next.prev = None
  queue.first = first.next
  return queue
    
def findFirstInQueue(queue):
  return queue.first

# So I don't have to keep starting the thing

a = Queue() 
n = Node() 
n.item = 2 
a.first = n 
a.last = n
