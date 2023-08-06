# Project: Superstore Marketing Campaign
<b>Question: Which customers are most likely to purchase a superstore membership?</b><br><br>
<picture><img src="https://github.com/rachel-m-wheeler/data-analytics/assets/102989527/a28160bb-2c34-4535-9dcf-984dee3cca99"></picture><a href="https://public.tableau.com/app/profile/rachel.wheeler/viz/SuperstoreMarketingDashboard_16913422353990/Dashboard1"><b> Tableau Dashboard</b></a><br>
<picture><img src="https://github.com/rachel-m-wheeler/data-analytics/assets/102989527/f33479ad-4db4-4665-9298-6814bfb83a97"></picture><a href="https://github.com/rachel-m-wheeler/superstore-marketing/blob/main/Superstore%20Marketing%20SQL.sql"><b> SQL</b></a><br>

## Project Summary

A hypothetical superstore is planning a year-end sale, where they will offer a gold membership to existing customers. Superstore management wants to understand which factors affect a customer's response to the membership offer, based on which customers accepted the offer in the last campaign. I imported the customer data into SQL and queried it, in order to unpack which customers are more likely to purchase a membership. I translated my SQL findings into a Tableau dashboard. 

## Process
<b>Data Source:</b> <a href="https://www.kaggle.com/datasets/ahsan81/superstore-marketing-campaign-dataset">Superstore Marketing Campaign Dataset</a> (Kaggle)<br>
 <br>
<b>Data Cleanup & Preparation:</b><br>
	• In the <em>Marital Status</em> column, I updated "YOLO", "Alone", and "Absurd" to "Single".<br>
• I created an <em>Age</em> column and calculated the age of each customer by subtracting the value in the <em>Year_Birth</em> column from 2023.
