-- Will have to run each individually to work. 
-- Q1: How many students had their project approved?
Create View Q1
AS   
Select StudentID, 
       StudentFName, 
       StudentLName, 
       StudentEmail
From StudentRegistration
Where StudentID IN 
(
Select StudentID
From StudentToTeam
);
GO

--select * from Q1

-- Q2: How many students DIDN'T have their project approved?
Create View Q2
AS  
Select StudentID, 
       StudentFName, 
       StudentLName, 
       StudentEmail
From StudentRegistration
Where StudentID NOT IN 
(
Select StudentID
From StudentToTeam
);
GO 
--select * from Q2 

-- Q3: For each year, identify the number of students who have participated "broken out" by department 
-- (i.e., you will need to know the major of the student at the time they were a part of the research group).
-- students who registered 
Create View Q3ForStudentsRegistered 
AS 
Select Major, 
       Count(*) AS NumOfStudentsForThatMajor 
From StudentRegistration 
Group by Major;
GO 
-- students approved 
--select * from Q3ForStudentsRegistered

Create View Q3ForStudentsApproven 
AS 
Select Major, 
       Count(*) AS NumOfStudentsForThatMajor
From StudentRegistration INNER JOIN StudentToTeam ON StudentRegistration.StudentID = StudentToTeam.StudentID
Group by Major;
GO 
--select * from Q3ForStudentsApproven

-- Q4: For 2014, what is the number students who participated in SRSD whose major is Computer Science?
Create View Q4
AS 
Select Count(Distinct StudentToTeam.StudentID) AS NumOfCSCIStudents
From StudentToTeam INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
	           INNER JOIN SRSDToTeam ON StudentToTeam.TeamID = SRSDToTeam.TeamID
Where Major = 'Computer Science' AND SRSDToTeam.AcademicYear = 2014;
GO 




-- Q5: For 2014, what is the number students who participated in SRSD whose major is Communications?
Create View Q5
AS 
Select Count(Distinct StudentToTeam.StudentID) AS NumOfCommStudents
From StudentToTeam INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
		   INNER JOIN SRSDToTeam ON StudentToTeam.TeamID = SRSDToTeam.TeamID
Where Major = 'Communications' AND SRSDToTeam.AcademicYear = 2014;
GO 



-- Q6: For 2014, what is the number students who participated in SRSD whose major is Business?
Create View Q6
AS 
Select Count(Distinct StudentToTeam.StudentID) AS NumOfBusStudents
From StudentToTeam INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
	           INNER JOIN SRSDToTeam ON StudentToTeam.TeamID = SRSDToTeam.TeamID
Where Major = 'Business' AND SRSDToTeam.AcademicYear = 2014;
GO 
 

-- Q7: For 2014, what is the number students who participated in SRSD whose major is Biology?
Create View Q7
AS 
Select Count(Distinct StudentToTeam.StudentID) AS NumOfBioStudents
From StudentToTeam INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
		   INNER JOIN SRSDToTeam ON StudentToTeam.TeamID = SRSDToTeam.TeamID
Where Major = 'Biology' AND SRSDToTeam.AcademicYear = 2014;
GO 
 


-- Q8: For 2014, what is the number students who participated in SRSD whose major is Art?
Create View Q8
AS 
Select Count(Distinct StudentToTeam.StudentID) AS NumOfArtStudents
From StudentToTeam INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
		   INNER JOIN SRSDToTeam ON StudentToTeam.TeamID = SRSDToTeam.TeamID
Where Major = 'Art' AND SRSDToTeam.AcademicYear = 2014;
GO 
 


-- Q9: For 2014, what is the number students who participated in SRSD whose major is Chemistry?
Create View Q9
AS 
Select Count(Distinct StudentToTeam.StudentID) AS NumOfChemStudents
From StudentToTeam INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
	           INNER JOIN SRSDToTeam ON StudentToTeam.TeamID = SRSDToTeam.TeamID
Where Major = 'Chemistry' AND SRSDToTeam.AcademicYear = 2014;
GO 



-- Q10: For 2014, what is the number students who participated in SRSD whose major is Education?
Create View Q10
AS 
Select Count(Distinct StudentToTeam.StudentID) AS NumOfEducationStudents
From StudentToTeam INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
		   INNER JOIN SRSDToTeam ON StudentToTeam.TeamID = SRSDToTeam.TeamID
Where Major = 'Education' AND SRSDToTeam.AcademicYear = 2014; 
GO 



-- Q11: For 2014, what is the number students who participated in SRSD whose major is Nursing?
Create View Q11
AS 
Select Count(Distinct StudentToTeam.StudentID) AS NumOfNursingStudents
From StudentToTeam INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
		   INNER JOIN SRSDToTeam ON StudentToTeam.TeamID = SRSDToTeam.TeamID
Where Major = 'Nursing' AND SRSDToTeam.AcademicYear = 2014;
GO 


-- Q12: For 2014, what is the number students who participated in SRSD whose major is English?
Create View Q12
AS 
Select Count(Distinct StudentToTeam.StudentID) AS NumOfChemStudents
From StudentToTeam INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
		   INNER JOIN SRSDToTeam ON StudentToTeam.TeamID = SRSDToTeam.TeamID
Where Major = 'English' AND SRSDToTeam.AcademicYear = 2014;
GO 



-- Q13: Who was the Keynote Speaker for the year 2014? Display their Firstname and Lastname (ex. Tim Carl),
-- Profession, Degree, University, and the year they were a keynote speaker. 
Create View Q13
AS 
Select SpeakerFName + ' ' + SpeakerLName AS KeynoteName, 
       Profession, 
       Degree, 
       University, 
       AcademicYear
From SRSDEvents INNER JOIN KeynoteSpeaker ON SRSDEvents.KeynoteID = KeynoteSpeaker.KeynoteID
Where SRSDEvents.AcademicYear = 2014;
GO 



-- Q14: Who was the Keynote Speaker for the year 2015? Display their Firstname and Lastname (ex. Tim Carl),
-- Profession, Degree, University, and the year they were a keynote speaker.
Create View Q14
AS 
Select SpeakerFName + ' ' + SpeakerLName AS KeynoteName, 
       Profession, 
       Degree, 
       University, 
       AcademicYear
From SRSDEvents INNER JOIN KeynoteSpeaker ON SRSDEvents.KeynoteID = KeynoteSpeaker.KeynoteID
Where SRSDEvents.AcademicYear = 2015;
GO 



-- Q15: Who was the Keynote Speaker for the year 2016? Display their Firstname and Lastname (ex. Tim Carl),
-- Profession, Degree, University, and the year they were a keynote speaker.
Create View Q15
AS 
Select SpeakerFName + ' ' + SpeakerLName AS KeynoteName, 
       Profession, 
       Degree, 
       University, 
       AcademicYear
From SRSDEvents INNER JOIN KeynoteSpeaker ON SRSDEvents.KeynoteID = KeynoteSpeaker.KeynoteID
Where SRSDEvents.AcademicYear = 2016;
GO 


-- Q16: Who was the Keynote Speaker for the year 2017? Display their Firstname and Lastname (ex. Tim Carl),
-- Profession, Degree, University, and the year they were a keynote speaker.
Create View Q16
AS 
Select SpeakerFName + ' ' + SpeakerLName AS KeynoteName, 
       Profession, 
       Degree, 
       University,
       AcademicYear
From SRSDEvents INNER JOIN KeynoteSpeaker ON SRSDEvents.KeynoteID = KeynoteSpeaker.KeynoteID
Where SRSDEvents.AcademicYear = 2017;
GO 


-- Q17: Who was the Keynote Speaker for the year 2018? Display their Firstname and Lastname (ex. Tim Carl),
-- Profession, Degree, University, and the year they were a keynote speaker.
Create View Q17
AS 
Select SpeakerFName + ' ' + SpeakerLName AS KeynoteName, 
       Profession, 
       Degree, 
       University, 
       AcademicYear
From SRSDEvents INNER JOIN KeynoteSpeaker ON SRSDEvents.KeynoteID = KeynoteSpeaker.KeynoteID
Where SRSDEvents.AcademicYear = 2018;
GO 


-- Q18: Who was the Keynote Speaker for the year 2019? Display their Firstname and Lastname (ex. Tim Carl),
-- Profession, Degree, University, and the year they were a keynote speaker.
Create View Q18
AS 
Select SpeakerFName + ' ' + SpeakerLName AS KeynoteName, 
       Profession, 
       Degree, 
       University, 
       AcademicYear
From SRSDEvents INNER JOIN KeynoteSpeaker ON SRSDEvents.KeynoteID = KeynoteSpeaker.KeynoteID
Where SRSDEvents.AcademicYear = 2019;
GO 


-- Q19: For each year, identify the faculty members who have participated and the number of 
-- students they mentored that year. Break this out by faculty member department.
Create View Q19
AS 
Select MentorFName + ' ' + MentorLName AS MentorName, 
       Department, 
       MentorRegistration.MentorEmail, 
       Count(StudentToTeam.StudentID) AS NumberOfStudentsMentored
From MentorToTeam INNER JOIN MentorRegistration ON MentorToTeam.MentorID = MentorRegistration.MentorID
		  INNER JOIN StudentToTeam ON MentorToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN SRSDToTeam ON MentorToTeam.TeamID = SRSDToTeam.TeamID
Where MentorRegistration.Department = 'Computer Science' AND SRSDToTeam.AcademicYear = 2014
Group by MentorFName, MentorLName, Department, MentorRegistration.MentorEmail;
GO 


-- Q20: For 2015, identify the faculty members who have participated with their Department being Communications and the number of 
-- students they mentored that year. 
Create View Q20
AS 
Select MentorFName + ' ' + MentorLName AS MentorName, 
       Department, 
       MentorRegistration.MentorEmail, 
       Count(StudentToTeam.StudentID) AS NumberOfStudentsMentored
From MentorToTeam INNER JOIN MentorRegistration ON MentorToTeam.MentorID = MentorRegistration.MentorID
		  INNER JOIN StudentToTeam ON MentorToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN SRSDToTeam ON MentorToTeam.TeamID = SRSDToTeam.TeamID
Where MentorRegistration.Department = 'Communications' AND SRSDToTeam.AcademicYear = 2015
Group by MentorFName, MentorLName, Department, MentorRegistration.MentorEmail; 
GO 


-- Q21: For 2014, identify the faculty members who have participated with their Department being Business and the number of 
-- students they mentored that year.
Create View Q21
AS 
Select MentorFName + ' ' + MentorLName AS MentorName, 
       Department, 
       MentorRegistration.MentorEmail, 
       Count(StudentToTeam.StudentID) AS NumberOfStudentsMentored
From MentorToTeam INNER JOIN MentorRegistration ON MentorToTeam.MentorID = MentorRegistration.MentorID
		  INNER JOIN StudentToTeam ON MentorToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN SRSDToTeam ON MentorToTeam.TeamID = SRSDToTeam.TeamID
Where MentorRegistration.Department = 'Business' AND SRSDToTeam.AcademicYear = 2014
Group by MentorFName, MentorLName, Department, MentorRegistration.MentorEmail; 
GO 



-- Q22: For 2015, identify the faculty members who have participated with their Department being Nursing and the number of 
-- students they mentored that year.
Create View Q22
AS 
Select MentorFName + ' ' + MentorLName AS MentorName, 
       Department, 
       MentorRegistration.MentorEmail, 
       Count(StudentToTeam.StudentID) AS NumberOfStudentsMentored
From MentorToTeam INNER JOIN MentorRegistration ON MentorToTeam.MentorID = MentorRegistration.MentorID
		  INNER JOIN StudentToTeam ON MentorToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN SRSDToTeam ON MentorToTeam.TeamID = SRSDToTeam.TeamID
Where MentorRegistration.Department = 'Nursing' AND SRSDToTeam.AcademicYear = 2015
Group by MentorFName, MentorLName, Department, MentorRegistration.MentorEmail; 
GO 




-- Q23: For 2016, identify the faculty members who have participated with their Department being English and the number of 
-- students they mentored that year.
Create View Q23
AS 
Select MentorFName + ' ' + MentorLName AS MentorName, 
       Department, 
       MentorRegistration.MentorEmail, 
       Count(StudentToTeam.StudentID) AS NumberOfStudentsMentored
From MentorToTeam INNER JOIN MentorRegistration ON MentorToTeam.MentorID = MentorRegistration.MentorID
		  INNER JOIN StudentToTeam ON MentorToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN SRSDToTeam ON MentorToTeam.TeamID = SRSDToTeam.TeamID
Where MentorRegistration.Department = 'English' AND SRSDToTeam.AcademicYear = 2016
Group by MentorFName, MentorLName, Department, MentorRegistration.MentorEmail; 
GO 


-- Q24: For 2019, identify the faculty members who have participated with their Department being Education and the number of 
-- students they mentored that year.
Create View Q24
AS 
Select MentorFName + ' ' + MentorLName AS MentorName, 
       Department, 
       MentorRegistration.MentorEmail, 
       Count(StudentToTeam.StudentID) AS NumberOfStudentsMentored
From MentorToTeam INNER JOIN MentorRegistration ON MentorToTeam.MentorID = MentorRegistration.MentorID
		  INNER JOIN StudentToTeam ON MentorToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN SRSDToTeam ON MentorToTeam.TeamID = SRSDToTeam.TeamID
Where MentorRegistration.Department = 'Education' AND SRSDToTeam.AcademicYear = 2019
Group by MentorFName, MentorLName, Department, MentorRegistration.MentorEmail; 
GO 


-- Q25: For 2015, identify the faculty members who have participated with their Department being Chemistry and the number of 
-- students they mentored that year.
Create View Q25
AS 
Select MentorFName + ' ' + MentorLName AS MentorName, 
       Department, 
       MentorRegistration.MentorEmail, 
       Count(StudentToTeam.StudentID) AS NumberOfStudentsMentored
From MentorToTeam INNER JOIN MentorRegistration ON MentorToTeam.MentorID = MentorRegistration.MentorID
		  INNER JOIN StudentToTeam ON MentorToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN SRSDToTeam ON MentorToTeam.TeamID = SRSDToTeam.TeamID
Where MentorRegistration.Department = 'Chemistry' AND SRSDToTeam.AcademicYear = 2015
Group by MentorFName, MentorLName, Department, MentorRegistration.MentorEmail; 
GO 
 




-- Q26: For 2018, identify the faculty members who have participated with their Department being Biology and the number of 
-- students they mentored that year.
Create View Q26
AS 
Select MentorFName + ' ' + MentorLName AS MentorName, 
       Department, 
       MentorRegistration.MentorEmail, 
       Count(StudentToTeam.StudentID) AS NumberOfStudentsMentored
From MentorToTeam INNER JOIN MentorRegistration ON MentorToTeam.MentorID = MentorRegistration.MentorID
		  INNER JOIN StudentToTeam ON MentorToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN SRSDToTeam ON MentorToTeam.TeamID = SRSDToTeam.TeamID
Where MentorRegistration.Department = 'Biology' AND SRSDToTeam.AcademicYear = 2018
Group by MentorFName, MentorLName, Department, MentorRegistration.MentorEmail; 
GO 




-- Q27: For 2015, identify the faculty members who have participated with their Department being Art and the number of 
-- students they mentored that year.
Create View Q27 
AS 
Select MentorFName + ' ' + MentorLName AS MentorName, 
       Department, 
       MentorRegistration.MentorEmail, 
       Count(StudentToTeam.StudentID) AS NumberOfStudentsMentored
From MentorToTeam INNER JOIN MentorRegistration ON MentorToTeam.MentorID = MentorRegistration.MentorID
		  INNER JOIN StudentToTeam ON MentorToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN SRSDToTeam ON MentorToTeam.TeamID = SRSDToTeam.TeamID
Where MentorRegistration.Department = 'Art' AND SRSDToTeam.AcademicYear = 2015
Group by MentorFName, MentorLName, Department, MentorRegistration.MentorEmail; 
GO 


-- Q28: How many Awards were won in 2014? 
Create View Q28
AS 
Select Count(AwardID) AS NumOfTeamsWhoWonAwards 
From AwardsToTeam
Where AcademicYear = 2014; 
GO 


-- Q29: How many Awards were won? 
Create View Q29
AS 
Select Count(AwardID) AS NumOfTeamsWhoWonAwards 
From AwardsToTeam; 
GO 




-- Q30: Who were the teams that won awards in 2014? Display their TeamID, the award name, and the year they won the award.  
Create View Q30
AS 
Select Distinct AwardsToTeam.TeamID,  
                AwardName, 
		AwardsToTeam.AcademicYear
From AwardsToTeam INNER JOIN StudentToTeam ON AwardsToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
		  INNER JOIN Awards ON AwardsToTeam.AwardID = Awards.AwardID
Where AwardsToTeam.AcademicYear = 2014;
GO 


-- Q31: Who were the teams that won awards in 2015? Display their TeamID, the award name, and the year they won the award.  
Create View Q31
AS 
Select Distinct AwardsToTeam.TeamID,  
                AwardName, 
		AwardsToTeam.AcademicYear
From AwardsToTeam INNER JOIN StudentToTeam ON AwardsToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
		  INNER JOIN Awards ON AwardsToTeam.AwardID = Awards.AwardID
Where AwardsToTeam.AcademicYear = 2015; 
GO 


-- Q32: Who were the teams that won awards in 2016? Display their TeamID, the award name, and the year they won the award.  
Create View Q32
AS 
Select Distinct AwardsToTeam.TeamID,  
                AwardName, 
		AwardsToTeam.AcademicYear
From AwardsToTeam INNER JOIN StudentToTeam ON AwardsToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
		  INNER JOIN Awards ON AwardsToTeam.AwardID = Awards.AwardID
Where AwardsToTeam.AcademicYear = 2016; 
GO 


-- Q33: Who were the teams that won awards in 2016? Display their TeamID, the award name, and the year they won the award.  
Create View Q33
AS 
Select Distinct AwardsToTeam.TeamID,  
                AwardName, 
		AwardsToTeam.AcademicYear
From AwardsToTeam INNER JOIN StudentToTeam ON AwardsToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
		  INNER JOIN Awards ON AwardsToTeam.AwardID = Awards.AwardID
Where AwardsToTeam.AcademicYear = 2017; 
GO 


-- Q34: Who were the teams that won awards in 2016? Display their TeamID, the award name, and the year they won the award.  
Create View Q34
AS 
Select Distinct AwardsToTeam.TeamID,  
                AwardName, 
		AwardsToTeam.AcademicYear
From AwardsToTeam INNER JOIN StudentToTeam ON AwardsToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
		  INNER JOIN Awards ON AwardsToTeam.AwardID = Awards.AwardID
Where AwardsToTeam.AcademicYear = 2018; 
GO 


-- Q35: Who were the teams that won awards in 2016? Display their TeamID, the award name, and the year they won the award.  
Create View Q35
AS 
Select Distinct AwardsToTeam.TeamID,  
                AwardName, 
		AwardsToTeam.AcademicYear
From AwardsToTeam INNER JOIN StudentToTeam ON AwardsToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
		  INNER JOIN Awards ON AwardsToTeam.AwardID = Awards.AwardID
Where AwardsToTeam.AcademicYear = 2019; 
GO 


-- Q36: What is the scedule for SRSD day in 2014?
Create View Q36
AS  
Select EventName, 
       EventLocation, 
       EventDate, 
       AcademicYear
From SRSDEvents
Where AcademicYear = 2014; 
GO 


-- Q37: What is the scedule for SRSD day in 2015?
Create View Q37
AS  
Select EventName, 
       EventLocation, 
       EventDate, 
       AcademicYear
From SRSDEvents
Where AcademicYear = 2015; 
GO 
 

-- Q38: What is the scedule for SRSD day in 2016?
Create View Q38
AS  
Select EventName, 
       EventLocation, 
       EventDate, 
       AcademicYear
From SRSDEvents
Where AcademicYear = 2016; 
GO 


-- Q39: What is the scedule for SRSD day in 2017?
Create View Q39
AS  
Select EventName, 
       EventLocation, 
       EventDate, 
       AcademicYear
From SRSDEvents
Where AcademicYear = 2017; 
GO 


-- Q40: What is the scedule for SRSD day in 2018?
Create View Q40
AS  
Select EventName, 
       EventLocation, 
       EventDate, 
       AcademicYear
From SRSDEvents
Where AcademicYear = 2018; 
GO 


-- Q41: What is the scedule for SRSD day in 2019?
Create View Q41
AS  
Select EventName, 
       EventLocation, 
       EventDate, 
       AcademicYear
From SRSDEvents
Where AcademicYear = 2019; 
GO 

-- Q42: For each academic year, identify both the faculty members who mentored multiple winning research 
-- groups and students who won multiple awards. Display the departments as well as the number of awards 
-- in each given year. Do this in a single query. You may need to use a UNION to implement it.
Create View Q42
AS
Select StudentRegistration.Major, 
       AwardsToTeam.AcademicYear, 
       Count(StudentToTeam.StudentID) AS NumOfStudentsWhoWon 
From AwardsToTeam INNER JOIN StudentToTeam ON AwardsToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
Group by StudentRegistration.Major, AcademicYear
UNION
Select MentorRegistration.Department, 
       AwardsToTeam.AcademicYear, 
       Count( MentorRegistration.MentorID) AS NumOfMentors 
From AwardsToTeam INNER JOIN MentorToTeam ON AwardsToTeam.TeamID = MentorToTeam.TeamID
		  INNER JOIN MentorRegistration ON MentorToTeam.MentorID = MentorRegistration.MentorID
Group by MentorRegistration.Department, 
	 AcademicYear; 
GO  
		 

-- Q43: For each department, identify the number of students who won awards each year.
Create View Q43
AS 
Select StudentRegistration.Major, 
       AcademicYear, 
       Count(StudentToTeam.StudentID) AS NumOfStudentsWhoWon 
From AwardsToTeam INNER JOIN StudentToTeam ON AwardsToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
Where AwardsToTeam.AcademicYear = 2014 
Group by StudentRegistration.Major, 
         AcademicYear; 
GO 

 


-- Q44: For each department, identify the number of students who won awards 2015.
Create View Q44
AS
Select StudentRegistration.Major, 
       AcademicYear, 
       Count(StudentToTeam.StudentID) AS NumOfStudentsWhoWon 
From AwardsToTeam INNER JOIN StudentToTeam ON AwardsToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
Where AwardsToTeam.AcademicYear = 2015
Group by StudentRegistration.Major, 
	 AcademicYear; 
GO 
 

-- Q45: For each department, identify the number of students who won awards 2016.
Create View Q45
AS
Select StudentRegistration.Major, 
       AcademicYear, 
       Count(StudentToTeam.StudentID) AS NumOfStudentsWhoWon 
From AwardsToTeam INNER JOIN StudentToTeam ON AwardsToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
Where AwardsToTeam.AcademicYear = 2016
Group by StudentRegistration.Major, 
	 AcademicYear; 
GO 


-- Q46: For each department, identify the number of students who won awards 2017.
Create View Q46
AS
Select StudentRegistration.Major, 
       AcademicYear, 
       Count(StudentToTeam.StudentID) AS NumOfStudentsWhoWon 
From AwardsToTeam INNER JOIN StudentToTeam ON AwardsToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
Where AwardsToTeam.AcademicYear = 2017
Group by StudentRegistration.Major, 
	 AcademicYear; 
GO 


-- Q47: For each department, identify the number of students who won awards 2018.
Create View Q47
AS
Select StudentRegistration.Major, 
       AcademicYear, 
       Count(StudentToTeam.StudentID) AS NumOfStudenstWhoWon 
From AwardsToTeam INNER JOIN StudentToTeam ON AwardsToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
Where AwardsToTeam.AcademicYear = 2018
Group by StudentRegistration.Major, 
	 AcademicYear; 
GO 


-- Q48: For each department, identify the number of students who won awards 2019.
Create View Q48
AS
Select StudentRegistration.Major, 
       AcademicYear, 
       Count(StudentToTeam.StudentID) AS NumOfStudentsWhoWon 
From AwardsToTeam INNER JOIN StudentToTeam ON AwardsToTeam.TeamID = StudentToTeam.TeamID
		  INNER JOIN StudentRegistration ON StudentToTeam.StudentID = StudentRegistration.StudentID
Where AwardsToTeam.AcademicYear = 2019
Group by StudentRegistration.Major, 
	 AcademicYear; 
GO  




-- Q49: Display all the students who registered an oral presentation. 
Create View Q49 
AS 
Select StudentFName + ' ' + StudentLName AS StudentName, 
       PresentationType.Presentation 
From PosterToStudent INNER JOIN StudentRegistration ON PosterToStudent.StudentID = StudentRegistration.StudentID
		     INNER JOIN PresentationType ON PosterToStudent.PresentationID = PresentationType.PresentationID
Where Presentation = 'Oral'; 
GO 


-- Q50: Display all the students who had their oral presentation approved.
Create View Q50
AS  
select distinct StudentFName + ' ' + StudentLName AS StudentName, 
	        PresentationType.Presentation , 
		AcademicYear
from PosterToStudent INNER JOIN StudentRegistration ON PosterToStudent.StudentID = StudentRegistration.StudentID
		     INNER JOIN PresentationType ON PosterToStudent.PresentationID = PresentationType.PresentationID
		     INNER JOIN StudentToTeam ON PosterToStudent.StudentID = StudentToTeam.StudentID
		     INNER JOIN SRSDToTeam ON StudentToTeam.TeamID = SRSDToTeam.TeamID
where Presentation = 'Oral' AND AcademicYear = 2018; 
GO 


