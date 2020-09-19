# Analysis of Fraudulent Debit Card Activity
Section 7 SQL homework

The following illustrates the creation of a database with containing client information, debit card data, transaction history, etc. for the use of analyzing or identifying fraudulent activity for client card services.

### Building the Database

In the file marked instructions is a .sql file with the schema used to build the database. **PLEASE NOTE the database file changed while importing the .csv files that was not reflected in the schema** It should not affect the database diagram. You can also view  the database relationship using the following [database diagram]( https://app.quickdatabasediagrams.com/#/d/rLbwCv)

### Querying the Database
Postgresql was used to query the database data to uncover suspicious transaction patterns, history, and create data usable for visualization.

#### Queries in Jupyter Notebook
All queries were added to the jupyter notebook where visualizations were built for practice. **PLEASE NOTE queries are not in order.** As I worked through the data, I would occasionally get stuck. I opted to move on and keep working and come back to some items leaving queries out of order.

#### Queries in .sql
I did not realize until the end of the assignment that a .sql file of our queries was required. I did copy the most recent query history from pgadmin4. I do not believe my database is set to record continuous query history (at least that I could tell).  I opted to include the query history I had (which does contain a good number of errant queries) since I included them in my jupyter notebook.

#### Views
Views were created in postgresql for the analysis conducted through the course of the project. However, because I was unaware the I could not export the entire history for the database, I didn't record their creation. I did include a .png file that shows the code that allows you to see the names of the views. **If something else is needed for views here please let me know.** I can do a demonstration of them and send the query history if needed.

### Reporting Fraud
A report answering the questions asked was created that includes .png files showing line transaction history for Cardholder's 2 and 18, and box plots showing transaction activity for Cardholder 25. **Please Note there was a discrepancy between the markdown file and the notebook in analyzing transaction history for Cardholder 25.** The notebook was requesting six months of information and the markdown file was requesting three. Ultimately for time reasons, I just analyzed the full dataset.
