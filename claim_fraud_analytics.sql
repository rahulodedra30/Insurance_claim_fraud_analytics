create database claims_fraud_analytics;

use claims_fraud_analytics;

select * from insurance_claims;

# Count of Fraudulent vs. Non-Fraudulent Claims:
SELECT fraud_reported, COUNT(*) AS count
FROM insurance_claims
GROUP BY fraud_reported;

# Average Number of Vehicles Involved in Fraudulent and Non-Fraudulent Claims:
SELECT fraud_reported, AVG(number_of_vehicles_involved) AS avg_vehicles
FROM insurance_claims
GROUP BY fraud_reported;

# Count of Claims by Incident State:
SELECT incident_state, COUNT(*) AS count
FROM insurance_claims
GROUP BY incident_state;

# Average Property Damage Reported by Gender:
SELECT insured_sex, AVG(CASE WHEN property_damage = 'YES' THEN 1 ELSE 0 END) AS avg_property_damage
FROM insurance_claims
GROUP BY insured_sex;

# Top 5 Occupations with the Highest Number of Fraudulent Claims:
SELECT insured_occupation, COUNT(*) AS fraud_count
FROM insurance_claims
WHERE fraud_reported = 'Y'
GROUP BY insured_occupation
ORDER BY fraud_count DESC
LIMIT 5;

# Number of Claims by Incident Type and Severity:
SELECT incident_type, incident_severity, COUNT(*) AS count
FROM insurance_claims
GROUP BY incident_type, incident_severity;

# Most Common Collision Type in Fraudulent Claims:
SELECT collision_type, COUNT(*) AS count
FROM insurance_claims
WHERE fraud_reported = 'Y'
GROUP BY collision_type
ORDER BY count DESC
LIMIT 1;

# Count of Claims with Bodily Injuries by Severity:
SELECT incident_severity, SUM(bodily_injuries) AS total_bodily_injuries
FROM insurance_claims
GROUP BY incident_severity;

# Distribution of Auto Makes in Fraudulent Claims:
SELECT auto_make, COUNT(*) AS fraud_count
FROM insurance_claims
WHERE fraud_reported = 'Y'
GROUP BY auto_make
ORDER BY fraud_count DESC;










