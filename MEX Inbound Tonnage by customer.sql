                                 SELECT  
                                 ORIGIN.BRANCHCODE AS "ORIGIN"
                                ,DEST.BRANCHCODE AS "DEST"                                
                                ,P.PROPOSALNAME
                                ,SUM(COALESCE(R.CHARGE_WT,0)) AS "TOTAL_TONNAGE"                                                   
                                FROM
                                ROUTE R
                                JOIN LOCATION ORIGIN ON ORIGIN.LOCATIONID = R.ORIGINID
                                JOIN LOCATION DEST ON DEST.LOCATIONID = R.DESTINATIONID
                                JOIN BID_PROCESS BP ON BP.BIDID = R.BIDID
                                JOIN BID B ON B.BIDID = R.BIDID
                                JOIN PROCESS P ON P.PROCESSID = BP.PROCESSID                        
                                WHERE P.DATERECEIVED >= '2017-01-01'
                                AND ORIGIN.BRANCHCODE IN ('MTY','MEX','GDL')
                                AND B.ROUNDNUM = 1
                                
                                GROUP BY 
                                ORIGIN.BRANCHCODE
                                ,DEST.BRANCHCODE                              
                                ,P.PROPOSALNAME
                                ORDER BY 
                                ORIGIN,DEST