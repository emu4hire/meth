;;Formal Methods Assignment 1, Problem 2 Part A
;;Michael Fulton

;;There are three colors, and 6 vertexes in this graph.
;;Connected vertexes cannot be colored the same.
;;Is there a way to color this graph?

;;Declare vertexes
(declare-const v0 Int)
(declare-const v1 Int)
(declare-const v2 Int)
(declare-const v3 Int)
(declare-const v4 Int)
(declare-const v5 Int)

;;A node must have a color between 0 and 2
(assert (and (> v0 -1) (< v0 3)))
(assert (and (> v1 -1) (< v1 3)))
(assert (and (> v2 -1) (< v2 3)))
(assert (and (> v3 -1) (< v3 3)))
(assert (and (> v4 -1) (< v4 3)))
(assert (and (> v5 -1) (< v5 3)))

;;Connecting nodes cannot be colored the same.

(assert (not (= v0 v1))) ;;1 and 2
(assert (not (= v0 v2))) ;;1 and 3
(assert (not (= v1 v2))) ;;2 and 3
(assert (not (= v1 v3))) ;;2 and 4
(assert (not (= v1 v4))) ;;2 and 5
(assert (not (= v2 v4))) ;;3 and 5
(assert (not (= v2 v5))) ;;3 and 6
(assert (not (= v3 v4))) ;;4 and 5
(assert (not (= v4 v5))) ;;5 and 6


;;Check satisfiability and get the model.
(check-sat)
(get-model)
