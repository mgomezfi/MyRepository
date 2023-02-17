public class DLinkTester {
	
	/**
	 * swap method:
	 * parameters DNode x and DNode y
	 * swaps references (and therefore the order) of both nodes
	 */
	public static boolean swap ( DNode x, DNode y){
		
		//Returns false if for DNodes x or y, if their previous or next is null for either nodes,
		//or if the nodes are null
		if( (x.getNext() == null && x.getPrev() == null) || (y.getNext() == null && y.getPrev() == null) 
				|| x == null || y == null) {
			return false;
		}
		
		//Case for when y is after x
		if ( x.getNext() == y ) {
			y.setPrev(x.getPrev());
			x.getPrev().setNext(y);
			x.setNext(null);
			x.setPrev(null);
			y.getNext().setPrev(x);
			x.setNext(y.getNext());
			y.setNext(x);
			x.setPrev(y);
			return true;
		}else if( y.getNext() == x) { //Case for when x is after y
			x.setPrev(y.getPrev());
			y.getPrev().setNext(x);
			y.setNext(null);
			y.setPrev(null);
			x.getNext().setPrev(y);
			y.setNext(x.getNext());
			x.setNext(y);
			y.setPrev(x);
			return true;
		}
		
		//Any other case
		DNode beforeX = x.getPrev();
		DNode afterX = x.getNext();
		DNode beforeY = y.getPrev();
		DNode afterY = y.getNext();
		beforeX.setNext(y);
		y.setPrev(beforeX);
		y.setNext(afterX);
		afterX.setPrev(y);
		beforeY.setNext(x);
		x.setPrev(beforeY);
		x.setNext(afterY);
		afterY.setPrev(x);
		
		return true;
		
		
	}
	
	/**
	 * concat method:
	 * parameters DList L and DList M
	 * Concatenates DList M to end of L,
	 * If one of them if empty, it returns a copy of the other one
	 * If both are empty, it returns an empty list
	 */
	public static DList concat( DList L, DList M) {
		
		//Initialization of DList
		DList N = new DList();
		
		//If first list isnt empty, add all elements to new DList
		if(!L.isEmpty()) {
			DNode indexL = L.getFirst();
			N.addFirst(new DNode(indexL.getElement(), null, null));
			indexL = indexL.getNext();
			while(indexL.getNext() != null) {
				N.addLast(new DNode(indexL.getElement(),null,null));
				indexL = indexL.getNext();
			}
		}
		if(M.isEmpty()) {// If second DList is empty then return the DList
			return N;
		}
		//Adds 2nd DList if first DList wasnt empty
		if(!M.isEmpty() && !N.isEmpty()) {
			DNode indexM = M.getFirst();
			N.addLast(new DNode(indexM.getElement(),null,null));
			indexM = indexM.getNext();
			while(indexM.getNext() != null) {
				
				N.addLast(new DNode(indexM.getElement(),null,null));
				indexM = indexM.getNext();
			}
			
		}else if(!M.isEmpty() && N.isEmpty()) {//If 1st DList was empty and 2nd wasnt, add 2nd DList
			DNode indexM = M.getFirst();
			N.addFirst(new DNode(indexM.getElement(), null, null));
			indexM = indexM.getNext();
			while(indexM.getNext() != null) {
				
				N.addLast(new DNode(indexM.getElement(),null,null));
				indexM = indexM.getNext();
			}
		}
		
		return N;
	}
	
	public static void reverse(DList Z) {
		
		//if Z is empty, do nothing
		if (Z.isEmpty()) {
			return;
		}
		//NOT allocating a new node just a reference to one already in it
		
		//Call method swap by amount of the size of DLIst/2
		for(int i = 0; i < (Z.size()/2); i++) {
			
			//Initializing both nodes for swapping
			DNode left = Z.getFirst();
			DNode right = Z.getLast();
			
			//FInd nodes to swap
			for(int j = 0; j < i; j++) {
				left = left.getNext();
				right = right.getPrev();
			}
			
			//Swap the nodes
			swap(left,right);
		}
	}
	
	public static DList merge ( DList L, DList M) {
		//FOR GRADER: Assuming one of the DList is empty, does it return a
		//reference to the second one as in the DList M? Or the one that isn't empty?
		//For this one if one is empty, it returns reference to the other one.
		
		//Initializing indexes for both DLists as well as the new DList
		DNode indexL = L.getFirst();
		DNode indexM = M.getFirst();
		DList N = new DList();
		
		//Puts the first nodes of each DList into new DList
		if(!L.isEmpty()) {
			N.addFirst(new DNode(indexL.getElement(),null,null));
			indexL = indexL.getNext();
			if(!M.isEmpty()) {
				N.addLast(new DNode(indexM.getElement(), null,null));
				indexM = indexM.getNext();
			}
			
		}else if(!M.isEmpty()) {//Case for when L is empty
			N.addFirst(new DNode(indexM.getElement(), null,null));
		}else {//Case for when both are empty (returns empty list)
			return N;
		}
		
		//Adds elements from each DList while theyre not empty
		while( indexL.getNext() != null || indexM.getNext() != null) {
			if (indexL.getNext() != null) {
				N.addLast(new DNode(indexL.getElement(), null, null));
				indexL = indexL.getNext();
			}
			if (indexM.getNext() != null) {
				N.addLast(new DNode(indexM.getElement(), null, null));
				indexM = indexM.getNext();
			}
		}
		return N;
	}
	
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DList L = new DList();
		DNode l = new DNode("one", null, null);
		L.addFirst(l);
		DNode l1 = new DNode("two", null, null);
		L.addLast(l1);
		DNode l2 = new DNode("three", null, null);
		L.addLast(l2);
		DNode l3 = new DNode("four", null, null);
		L.addLast(l3);
		DNode l4 = new DNode("five", null, null);
		L.addLast(l4);
		DNode l5 = new DNode("six", null, null);
		DList M = new DList();
		M.addFirst(new DNode("1", null,null));
		for (int i = 2; i < 9; i++) {
			M.addLast(new DNode(Integer.toString(i),null,null));
		}
		L.addLast(l5);
		System.out.println("Swap method test:\n Initial DList L values:  " + L.toString());
		swap(l3,l4);
		System.out.println("Nodes next to each other: \nX is in front of Y:" + L.toString());
		swap(l3,l4);
		System.out.println("Y in front of X:" + L.toString());
		swap(l,l);
		System.out.println("Swap method calls the same node for both Parameters:  " + L.toString());
		DList empty = new DList();
		System.out.println("\n\nConcat method test:\nInitial Values of Both DLists: \n" + L.toString() + "\n" + M.toString());
		DList concatTest = concat(L,M);
		System.out.println("Concatenation: " + concatTest.toString());
		concatTest = concat(empty,L);
		System.out.println("Concatenation with one empty DList: " + concatTest.toString());
		System.out.println("\n\nReverse method test:\nInitial Values of Both DLists: \n" + L.toString() + "\n" + M.toString());
		reverse(L);
		reverse(M);
		System.out.println("After Reverse method: \n" + L.toString() + "\n" + M.toString());
		reverse(L);
		reverse(M);
		System.out.println("\n\nMerge method test:\nInitial Values of Both DLists: \n" + L.toString() + "\n" + M.toString());
		DList merge = merge(L,M);
		System.out.println("After Merge method: \n" + merge.toString());
	}

}
