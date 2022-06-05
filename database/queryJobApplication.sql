/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [tblJobApplication].[id_freelancer], [tblUser].[fullname], [tblUser].[email], [tblJob].[title], [tblUser].[avatar],[tblJobApplication].status
  FROM ([tblUser] INNER JOIN [tblFreelancer] ON [tblUser].id_user = [tblFreelancer].[id_freelancer]
  INNER JOIN [tblJobApplication] ON [tblJobApplication].[id_freelancer] = [tblFreelancer].[id_freelancer] 
  INNER JOIN [tblJob] ON [tblJob].[id_job] = [tblJobApplication].[id_job]) 
  WHERE [tblJob].[id_employer] = 4
  AND [tblJobApplication].[status] IS NULL

  SELECT [tblUser].fullname, [tblSkill].[id_skill],[tblSkill].[skill_name] 
           FROM ((tblUser INNER JOIN [tblFreelancerSkill] ON [tblUser].[id_user] = [tblFreelancerSkill].[id_freelancer])
            INNER JOIN [tblSkill] ON [tblFreelancerSkill].[id_skill] = [tblSkill].[id_skill])
           