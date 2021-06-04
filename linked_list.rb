class LinkedList
	attr_accessor :data, :next

	def initialize(data)
		self.data = data
	end

	def self.add(head, data, pos = nil)
		if head
			count = 1
			pos ||= items_count(head) + 1
			while(head && (count < (pos - 1)))
				count += 1
				head = head.next
			end
			temp = head.next
			head.next = Node.new(data)
			head.next.next = temp
		else
			head = Node.new(data)
		end
	end

	def self.delete(head, pos)
		count = 1
		while(head && (count < (pos - 1)))
			count += 1
			head = head.next
		end
		temp = head.next
		head.next = temp.next
	end

	def self.items_count(head)
		return "Circular Linked List" if circular(head)
		count = 0;
		while(head)
			count += 1
			head = head.next
		end
		count
	end

	def self.items(head)
		return "Circular Linked List" if circular(head)
		while(head)
			p head.data
			head = head.next
		end
	end

	def self.item(head, pos)
		count = 1
		while(head && (count < pos))
			count += 1
			head = head.next
		end
		head
	end

	def self.circular(head)
		visited = {}
		while(head)
			if visited[head]
				return true
				break
			else
				visited[head] = true
			end
			head = head.next
		end
		return false
	end
end