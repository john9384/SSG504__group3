
(defun first-n-items(n l)
	(if (= n 1)
		(list (car l))
		(cons (car l) (first-n-items (- n 1) (cdr l)))))
 
;;Return a list containing all elements after the nth element
(defun after-n-items(n l)
	(if (= n 0)
		l
		(after-n-items (- n 1) (cdr l))))
 
;;Get the q value for the merge-sort function
(defun get-q(p l)
	(floor (/ (+ p (length l)) 2)))
 
;;Merge two sorted lists
(defun merge-sort-merge(l1 l2)
	(if (= (length l2) 0)
		l1
		(if (= (length l1) 0)
			l2
			(if (<= (car l1) (car l2))
				(cons (car l1) (merge-sort-merge (cdr l1) l2))
				(cons (car l2) (merge-sort-merge l1 (cdr l2)))))))
 
;;Sort list l with the insertion sort algorithm
(defun merge-sort(l)
	(if (or (= (length l) 1) (= (length l) 0))
		l
		(merge-sort-merge
			(merge-sort (first-n-items (get-q 1 l) l))
			(merge-sort (after-n-items (get-q 1 l) l))))
)

(merge-sort (list 2 5 1 4 6 32 1 4 6 7 8))