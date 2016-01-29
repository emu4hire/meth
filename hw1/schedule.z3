;;Formal Methods, Assignment 1, Problem 1
;;Michael Fulton

;; pij means class i is scheduled in period j
;;Class 1
(declare-const p00 Bool)
(declare-const p01 Bool)
(declare-const p02 Bool)

;;Class 2
(declare-const p10 Bool)
(declare-const p11 Bool)
(declare-const p12 Bool)

;;Class 3
(declare-const p20 Bool)
(declare-const p21 Bool)
(declare-const p22 Bool)

;;Class 4
(declare-const p30 Bool)
(declare-const p31 Bool)
(declare-const p32 Bool)

;;All classes must be assigned.
(echo "All classes must be assigned a period")
(assert (or p00 p01 p02))
(assert (or p10 p11 p12))
(assert (or p20 p21 p22))
(assert (or p30 p31 p32))

;;Class 1 cannot be scheduled at the same time as any class.
(echo "Class 1 cannot be scheduled at the same time as any class")
(assert (or (and p00 (not (or p10 p20 p30)))
            (and p01 (not (or p11 p21 p31)))
            (and p02 (not (or p12 p22 p32)))))

;;Classes 2 and 3 must be scheduled at the same time.
(echo "Class 2 and 3 must be scheduled at the same time.")
(assert (or (and p10 p20)
            (and p11 p21)
            (and p12 p22)))

;;Class 4 must be scheduled in the period just before class 2.
(echo "Class 4 must be scheduled in the period before class 2")
(assert (not p10))
(assert (=> p30 p11))
(assert (=> p31 p12))
(assert (not p32))

(check-sat)
(get-model)
