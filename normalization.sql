-- 1st Normal Form (1NF) - a table that has all the characteristics of a relation and a defined primary key
--
-- 2nd Normal Form (2NF) - a table that is in 1NF and has no partial dependencies
--
-- Partial dependency - a condition where an attribute is dependent on only part of a composite primary key instead of on the whole key
--
-- 3rd Normal Form (3NF) = a table that is in 2NF and has no transitive dependencies
--
-- transitive dependency - In a relation having at least three attributes, for example R(A,B,C), the situation in which A->B, B=>C, but B does not determine A.
-- Non-key; columns determine other non-key columns
--
-- Boyce = Codd Normal Form (BCNF) - a relation in which all redundancy based on functional dependency has been removed

-- SKU_data
-- SKU->(SKU_Description, Department, Buyer)
-- Buyer->Department

-- patient_prescription
-- (MedName, PatientID, Date)->Refills, Allowed, PatientName, Dosage, Shelflife
-- PatientID -> PatientName
-- MedName = Shelflife

half the notes writen in notebook
