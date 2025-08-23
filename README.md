# 📊 DataSpark: Illuminating Insights for Global Electronics  

![](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/resource-cs-dataspark_dwmbhq.webp)

## 🚀 Project Overview  
This project is part of **Global Electronics’ Data Analytics initiative** to leverage customer, product, sales, and store data for actionable business insights. Using **SQL Server, Python, and Power BI**, we built an end-to-end pipeline from raw CSVs → cleaned datasets → SQL integration → interactive Power BI dashboards.  

The dashboards enable business users to analyze **customers, products, sales trends, and store performance** across multiple geographies and timeframes, ultimately helping Global Electronics **increase customer satisfaction, optimize operations, and drive business growth**.  

---

## 🛠️ Tools & Technologies  
- **Python (VS Code):** Data cleaning & preprocessing  
- **SQL Server (SSMS):** Data storage & management  
- **Power BI:** Interactive dashboarding & visualization  
- **CSV files:** Initial raw datasets  

---

## 📂 Project Workflow  
1. **Data Cleaning (Python)**  
   - Handled missing values & duplicates  
   - Converted datatypes (dates, currency, numeric fields)  
   - Standardized categorical values

   {
 "cells": [
  {
   "cell_type": "markdown",
   "id": "110ca32b",
   "metadata": {},
   "source": [
    "## Customers Table Data Cleaning and save as CSV and load to SSMS"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "1fef1b55",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "    CustomerKey  Gender               Name            City State Code  \\\n",
      "0           301  Female      Lilly Harding  WANDEARAH EAST         SA   \n",
      "1           325  Female       Madison Hull      MOUNT BUDD         WA   \n",
      "2           554  Female      Claire Ferres       WINJALLOK        VIC   \n",
      "3           786    Male  Jai Poltpalingada    MIDDLE RIVER         SA   \n",
      "4          1042    Male    Aidan Pankhurst   TAWONGA SOUTH        VIC   \n",
      "5          1086    Male       Hayden Clegg        TEMPLERS         SA   \n",
      "6          1133    Male    Nicholas Caffyn  JUBILEE POCKET        QLD   \n",
      "7          1256    Male      Lincoln Jenks        KULLOGUM        QLD   \n",
      "8          1314    Male       Isaac Israel     EDITH RIVER         NT   \n",
      "9          1568    Male        Luke Virtue           KOTTA        VIC   \n",
      "10         1585  Female     Anna Hallstrom      GREEN LAKE        VIC   \n",
      "11         1626  Female         Mary Leach     NEDS CORNER        VIC   \n",
      "12         1642  Female       Ruby Ambrose           TARLO        NSW   \n",
      "13         1677    Male         Dean Innes       ELLESMERE        QLD   \n",
      "14         1817  Female  Laura Le Rennetel       BEAUCHAMP        VIC   \n",
      "15         1863  Female    Chelsea Watkins      NAMBOUR DC        QLD   \n",
      "16         1945    Male  Angus Beaurepaire     GREENFIELDS         WA   \n",
      "17         2238  Female   Isabelle Cochran       BRUCKNELL        VIC   \n",
      "18         2248    Male        Rory Spargo            JUNG        VIC   \n",
      "19         2435  Female        Lilian Hall      BLAKEBROOK        NSW   \n",
      "\n",
      "                 State Zip Code    Country  Continent    Birthday  \n",
      "0      South Australia     5523  Australia  Australia  07-03-1939  \n",
      "1    Western Australia     6522  Australia  Australia  27-09-1979  \n",
      "2             Victoria     3380  Australia  Australia  26-05-1947  \n",
      "3      South Australia     5223  Australia  Australia  17-09-1957  \n",
      "4             Victoria     3698  Australia  Australia  19-11-1965  \n",
      "5      South Australia     5371  Australia  Australia  20-01-1954  \n",
      "6           Queensland     4802  Australia  Australia  22-11-1969  \n",
      "7           Queensland     4660  Australia  Australia  03-12-1950  \n",
      "8   Northern Territory      852  Australia  Australia  21-12-1965  \n",
      "9             Victoria     3565  Australia  Australia  25-07-1975  \n",
      "10            Victoria     3401  Australia  Australia  08-12-1990  \n",
      "11            Victoria     3496  Australia  Australia  17-10-1985  \n",
      "12     New South Wales     2580  Australia  Australia  03-03-1965  \n",
      "13          Queensland     4610  Australia  Australia  22-11-1964  \n",
      "14            Victoria     3579  Australia  Australia  07-10-1986  \n",
      "15          Queensland     4560  Australia  Australia  22-09-1984  \n",
      "16   Western Australia     6210  Australia  Australia  20-09-1974  \n",
      "17            Victoria     3268  Australia  Australia  31-10-1969  \n",
      "18            Victoria     3401  Australia  Australia  15-12-1987  \n",
      "19     New South Wales     2480  Australia  Australia  04-01-1968  \n",
      "<class 'pandas.core.frame.DataFrame'>\n",
      "RangeIndex: 15266 entries, 0 to 15265\n",
      "Data columns (total 10 columns):\n",
      " #   Column       Non-Null Count  Dtype \n",
      "---  ------       --------------  ----- \n",
      " 0   CustomerKey  15266 non-null  int64 \n",
      " 1   Gender       15266 non-null  object\n",
      " 2   Name         15266 non-null  object\n",
      " 3   City         15266 non-null  object\n",
      " 4   State Code   15266 non-null  object\n",
      " 5   State        15266 non-null  object\n",
      " 6   Zip Code     15266 non-null  object\n",
      " 7   Country      15266 non-null  object\n",
      " 8   Continent    15266 non-null  object\n",
      " 9   Birthday     15266 non-null  object\n",
      "dtypes: int64(1), object(9)\n",
      "memory usage: 1.2+ MB\n",
      "None\n",
      "✅ Cleaned data saved to CSV and inserted into SQL Server (SSMS) successfully!\n"
     ]
    }
   ],
   "source": [
    "import pandas as pd\n",
    "from datetime import datetime\n",
    "import pyodbc   # ✅ using pyodbc for SQL Server\n",
    "\n",
    "# ========================\n",
    "# 1. LOAD & CLEAN CSV\n",
    "# ========================\n",
    "customers = pd.read_csv(\n",
    "    r\"D:\\CERTIFICATIONS\\GUVI\\Capestone Project -2 (Spark BI)\\Customers.csv\",\n",
    "    encoding='latin1',\n",
    "    keep_default_na=False   # ✅ keeps \"NA\" (state code) as text instead of NaN\n",
    ")\n",
    "\n",
    "# Function to clean Birthday\n",
    "def parse_date(date_str):\n",
    "    if pd.isna(date_str) or date_str == \"\":\n",
    "        return None\n",
    "    for fmt in (\"%d-%m-%Y\", \"%m-%d-%Y\", \"%d/%m/%Y\", \"%m/%d/%Y\"):\n",
    "        try:\n",
    "            return datetime.strptime(str(date_str).strip(), fmt)\n",
    "        except ValueError:\n",
    "            continue\n",
    "    return None  # if nothing works\n",
    "\n",
    "# Apply parser\n",
    "customers['Birthday'] = customers['Birthday'].apply(parse_date)\n",
    "\n",
    "# Format as string \"DD-MM-YYYY\"\n",
    "customers['Birthday'] = customers['Birthday'].apply(\n",
    "    lambda x: x.strftime('%d-%m-%Y') if pd.notna(x) else None\n",
    ")\n",
    "\n",
    "# ✅ Preview cleaned data\n",
    "print(customers.head(20))\n",
    "print(customers.info())\n",
    "\n",
    "# ========================\n",
    "# 1a. SAVE CLEANED DATA TO CSV\n",
    "# ========================\n",
    "customers.to_csv(\n",
    "    r\"D:\\CERTIFICATIONS\\GUVI\\Capestone Project -2 (Spark BI)\\Cleaned CSV\\Customers_Cleaned.csv\",\n",
    "    index=False,\n",
    "    encoding='utf-8',\n",
    "    na_rep=\"\"   # NaN stays empty in CSV\n",
    ")\n",
    "\n",
    "# ========================\n",
    "# 2. SQL SERVER CONNECTION (SSMS)\n",
    "# ========================\n",
    "# ✅ Use Driver 17\n",
    "conn = pyodbc.connect(\n",
    "    \"Driver={ODBC Driver 17 for SQL Server};\"\n",
    "    \"Server=DESKTOP-OO5HFAI\\\\SQLEXPRESS;\"\n",
    "    \"Database=Data_Spark;\"\n",
    "    \"Trusted_Connection=yes;\"\n",
    ")\n",
    "\n",
    "cursor = conn.cursor()\n",
    "\n",
    "# ========================\n",
    "# 3. INSERT CLEANED DATA\n",
    "# ========================\n",
    "insert_query = \"\"\"\n",
    "INSERT INTO customers \n",
    "(CustomerKey, Gender, Name, City, StateCode, State, ZipCode, Country, Continent, Birthday)\n",
    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\n",
    "\"\"\"\n",
    "\n",
    "for _, row in customers.iterrows():\n",
    "    cursor.execute(insert_query, (\n",
    "        int(row['CustomerKey']) if str(row['CustomerKey']).isdigit() else None,\n",
    "        row['Gender'],\n",
    "        row['Name'],\n",
    "        row['City'],\n",
    "        row['State Code'],\n",
    "        row['State'],\n",
    "        row['Zip Code'],\n",
    "        row['Country'],\n",
    "        row['Continent'],\n",
    "        datetime.strptime(row['Birthday'], \"%d-%m-%Y\").date() if row['Birthday'] else None\n",
    "    ))\n",
    "\n",
    "conn.commit()\n",
    "cursor.close()\n",
    "conn.close()\n",
    "\n",
    "print(\"✅ Cleaned data saved to CSV and inserted into SQL Server (SSMS) successfully!\")\n",
    "\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f3b55342",
   "metadata": {},
   "source": [
    "## Exchange Rate Table Data Cleaning and save as CSV and load to SSMS"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "5eb18903",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "          Date Currency  Exchange\n",
      "0   01-01-2015      USD    1.0000\n",
      "1   01-01-2015      CAD    1.1583\n",
      "2   01-01-2015      AUD    1.2214\n",
      "3   01-01-2015      EUR    0.8237\n",
      "4   01-01-2015      GBP    0.6415\n",
      "5   01-02-2015      USD    1.0000\n",
      "6   01-02-2015      CAD    1.1682\n",
      "7   01-02-2015      AUD    1.2323\n",
      "8   01-02-2015      EUR    0.8304\n",
      "9   01-02-2015      GBP    0.6477\n",
      "10  01-03-2015      USD    1.0000\n",
      "11  01-03-2015      CAD    1.1682\n",
      "12  01-03-2015      AUD    1.2323\n",
      "13  01-03-2015      EUR    0.8304\n",
      "14  01-03-2015      GBP    0.6477\n",
      "15  01-04-2015      USD    1.0000\n",
      "16  01-04-2015      CAD    1.1682\n",
      "17  01-04-2015      AUD    1.2323\n",
      "18  01-04-2015      EUR    0.8304\n",
      "19  01-04-2015      GBP    0.6477\n",
      "<class 'pandas.core.frame.DataFrame'>\n",
      "RangeIndex: 11215 entries, 0 to 11214\n",
      "Data columns (total 3 columns):\n",
      " #   Column    Non-Null Count  Dtype  \n",
      "---  ------    --------------  -----  \n",
      " 0   Date      11215 non-null  object \n",
      " 1   Currency  11215 non-null  object \n",
      " 2   Exchange  11215 non-null  float64\n",
      "dtypes: float64(1), object(2)\n",
      "memory usage: 263.0+ KB\n",
      "None\n",
      "✅ Cleaned Exchange_Rates saved to CSV!\n",
      "✅ Cleaned Exchange_Rates inserted into SQL Server (SSMS) successfully!\n"
     ]
    }
   ],
   "source": [
    "import pandas as pd  \n",
    "from datetime import datetime\n",
    "import pyodbc   # ✅ using pyodbc for SQL Server\n",
    "\n",
    "# ========================\n",
    "# 1. LOAD & CLEAN CSV\n",
    "# ========================\n",
    "exchange_rates = pd.read_csv(\n",
    "    r\"D:\\CERTIFICATIONS\\GUVI\\Capestone Project -2 (Spark BI)\\Exchange_Rates.csv\",\n",
    "    encoding='latin1',\n",
    "    keep_default_na=False\n",
    ")\n",
    "\n",
    "# Function to clean Date column\n",
    "def parse_date(date_str):\n",
    "    if pd.isna(date_str) or date_str == \"\":\n",
    "        return None\n",
    "    for fmt in (\"%d-%m-%Y\", \"%m-%d-%Y\", \"%d/%m/%Y\", \"%m/%d/%Y\", \"%Y-%m-%d\"):\n",
    "        try:\n",
    "            return datetime.strptime(str(date_str).strip(), fmt)\n",
    "        except ValueError:\n",
    "            continue\n",
    "    return None  # if nothing works\n",
    "\n",
    "# Apply parser\n",
    "exchange_rates['Date'] = exchange_rates['Date'].apply(parse_date)\n",
    "\n",
    "# Format as string \"DD-MM-YYYY\"\n",
    "exchange_rates['Date'] = exchange_rates['Date'].apply(\n",
    "    lambda x: x.strftime('%d-%m-%Y') if pd.notna(x) else None\n",
    ")\n",
    "\n",
    "# ✅ Preview cleaned data\n",
    "print(exchange_rates.head(20))\n",
    "print(exchange_rates.info())\n",
    "\n",
    "# ========================\n",
    "# 1a. SAVE CLEANED DATA TO CSV\n",
    "# ========================\n",
    "exchange_rates.to_csv(\n",
    "    r\"D:\\CERTIFICATIONS\\GUVI\\Capestone Project -2 (Spark BI)\\Cleaned CSV\\Exchange_Rates_Cleaned.csv\",\n",
    "    index=False,\n",
    "    encoding='utf-8',\n",
    "    na_rep=\"\"\n",
    ")\n",
    "\n",
    "print(\"✅ Cleaned Exchange_Rates saved to CSV!\")\n",
    "\n",
    "# ========================\n",
    "# 2. SQL SERVER CONNECTION (SSMS)\n",
    "# ========================\n",
    "conn = pyodbc.connect(\n",
    "    \"Driver={ODBC Driver 17 for SQL Server};\"\n",
    "    \"Server=DESKTOP-OO5HFAI\\\\SQLEXPRESS;\"\n",
    "    \"Database=Data_Spark;\"\n",
    "    \"Trusted_Connection=yes;\"\n",
    ")\n",
    "\n",
    "cursor = conn.cursor()\n",
    "\n",
    "# ========================\n",
    "# 3. INSERT CLEANED DATA\n",
    "# ========================\n",
    "insert_query = \"\"\"\n",
    "INSERT INTO Exchange_Rates \n",
    "(Date, Currency, Exchange)\n",
    "VALUES (?, ?, ?)\n",
    "\"\"\"\n",
    "\n",
    "for _, row in exchange_rates.iterrows():\n",
    "    cursor.execute(insert_query, (\n",
    "        datetime.strptime(row['Date'], \"%d-%m-%Y\").date() if row['Date'] else None,\n",
    "        row['Currency'],\n",
    "        float(row['Exchange']) if row['Exchange'] not in (\"\", None) else None\n",
    "    ))\n",
    "\n",
    "conn.commit()\n",
    "cursor.close()\n",
    "conn.close()\n",
    "\n",
    "print(\"✅ Cleaned Exchange_Rates inserted into SQL Server (SSMS) successfully!\")\n",
    "\n",
    "\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "26262a87",
   "metadata": {},
   "source": [
    "## Products Table Data Cleaning and save as CSV and load to SSMS"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "e7469d0b",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "    ProductKey                                       Product Name    Brand  \\\n",
      "0            1                Contoso 512MB MP3 Player E51 Silver  Contoso   \n",
      "1            2                  Contoso 512MB MP3 Player E51 Blue  Contoso   \n",
      "2            3                   Contoso 1G MP3 Player E100 White  Contoso   \n",
      "3            4                  Contoso 2G MP3 Player E200 Silver  Contoso   \n",
      "4            5                     Contoso 2G MP3 Player E200 Red  Contoso   \n",
      "5            6                   Contoso 2G MP3 Player E200 Black  Contoso   \n",
      "6            7                    Contoso 2G MP3 Player E200 Blue  Contoso   \n",
      "7            8                  Contoso 4G MP3 Player E400 Silver  Contoso   \n",
      "8            9                   Contoso 4G MP3 Player E400 Black  Contoso   \n",
      "9           10                   Contoso 4G MP3 Player E400 Green  Contoso   \n",
      "10          11                  Contoso 4G MP3 Player E400 Orange  Contoso   \n",
      "11          12             Contoso 4GB Flash MP3 Player E401 Blue  Contoso   \n",
      "12          13            Contoso 4GB Flash MP3 Player E401 Black  Contoso   \n",
      "13          14           Contoso 4GB Flash MP3 Player E401 Silver  Contoso   \n",
      "14          15            Contoso 4GB Flash MP3 Player E401 White  Contoso   \n",
      "15          16  Contoso 8GB Super-Slim MP3/Video Player M800 W...  Contoso   \n",
      "16          17   Contoso 8GB Super-Slim MP3/Video Player M800 Red  Contoso   \n",
      "17          18  Contoso 8GB Super-Slim MP3/Video Player M800 G...  Contoso   \n",
      "18          19  Contoso 8GB Super-Slim MP3/Video Player M800 Pink  Contoso   \n",
      "19          20        Contoso 8GB MP3 Player new model M820 Black  Contoso   \n",
      "\n",
      "     Color  Unit Cost USD  Unit Price USD  SubcategoryKey Subcategory  \\\n",
      "0   Silver           6.62           12.99             101     MP4&MP3   \n",
      "1     Blue           6.62           12.99             101     MP4&MP3   \n",
      "2    White           7.40           14.52             101     MP4&MP3   \n",
      "3   Silver          11.00           21.57             101     MP4&MP3   \n",
      "4      Red          11.00           21.57             101     MP4&MP3   \n",
      "5    Black          11.00           21.57             101     MP4&MP3   \n",
      "6     Blue          11.00           21.57             101     MP4&MP3   \n",
      "7   Silver          30.58           59.99             101     MP4&MP3   \n",
      "8    Black          30.58           59.99             101     MP4&MP3   \n",
      "9    Green          30.58           59.99             101     MP4&MP3   \n",
      "10  Orange          30.58           59.99             101     MP4&MP3   \n",
      "11    Blue          35.72           77.68             101     MP4&MP3   \n",
      "12   Black          35.72           77.68             101     MP4&MP3   \n",
      "13  Silver          35.72           77.68             101     MP4&MP3   \n",
      "14   White          35.72           77.68             101     MP4&MP3   \n",
      "15   White          50.56          109.95             101     MP4&MP3   \n",
      "16     Red          50.56          109.95             101     MP4&MP3   \n",
      "17   Green          50.56          109.95             101     MP4&MP3   \n",
      "18    Pink          50.56          109.95             101     MP4&MP3   \n",
      "19   Black          61.62          134.00             101     MP4&MP3   \n",
      "\n",
      "    CategoryKey Category  \n",
      "0             1    Audio  \n",
      "1             1    Audio  \n",
      "2             1    Audio  \n",
      "3             1    Audio  \n",
      "4             1    Audio  \n",
      "5             1    Audio  \n",
      "6             1    Audio  \n",
      "7             1    Audio  \n",
      "8             1    Audio  \n",
      "9             1    Audio  \n",
      "10            1    Audio  \n",
      "11            1    Audio  \n",
      "12            1    Audio  \n",
      "13            1    Audio  \n",
      "14            1    Audio  \n",
      "15            1    Audio  \n",
      "16            1    Audio  \n",
      "17            1    Audio  \n",
      "18            1    Audio  \n",
      "19            1    Audio  \n",
      "<class 'pandas.core.frame.DataFrame'>\n",
      "RangeIndex: 2517 entries, 0 to 2516\n",
      "Data columns (total 10 columns):\n",
      " #   Column          Non-Null Count  Dtype  \n",
      "---  ------          --------------  -----  \n",
      " 0   ProductKey      2517 non-null   int64  \n",
      " 1   Product Name    2517 non-null   object \n",
      " 2   Brand           2517 non-null   object \n",
      " 3   Color           2517 non-null   object \n",
      " 4   Unit Cost USD   2517 non-null   float64\n",
      " 5   Unit Price USD  2517 non-null   float64\n",
      " 6   SubcategoryKey  2517 non-null   int64  \n",
      " 7   Subcategory     2517 non-null   object \n",
      " 8   CategoryKey     2517 non-null   int64  \n",
      " 9   Category        2517 non-null   object \n",
      "dtypes: float64(2), int64(3), object(5)\n",
      "memory usage: 196.8+ KB\n",
      "None\n",
      "✅ Products data saved to cleaned CSV!\n",
      "✅ Products data inserted into SQL Server (SSMS) successfully!\n"
     ]
    }
   ],
   "source": [
    "import pandas as pd\n",
    "import pyodbc   # ✅ using pyodbc for SQL Server\n",
    "\n",
    "# ========================\n",
    "# 1. LOAD CSV\n",
    "# ========================\n",
    "products = pd.read_csv(\n",
    "    r\"D:\\CERTIFICATIONS\\GUVI\\Capestone Project -2 (Spark BI)\\Products.csv\",\n",
    "    encoding='latin1',\n",
    "    keep_default_na=False\n",
    ")\n",
    "\n",
    "# ========================\n",
    "# CLEAN CURRENCY COLUMNS\n",
    "# ========================\n",
    "# Remove $ sign, commas, and extra spaces then convert to float\n",
    "for col in ['Unit Cost USD', 'Unit Price USD']:\n",
    "    products[col] = (\n",
    "        products[col]\n",
    "        .astype(str)                 # ensure string\n",
    "        .str.replace(r'[$,]', '', regex=True)  # remove $ and ,\n",
    "        .str.strip()                 # remove spaces\n",
    "    )\n",
    "    # Convert to float safely\n",
    "    products[col] = products[col].apply(lambda x: float(x) if x not in (\"\", \"None\", None) else None)\n",
    "\n",
    "# ✅ Preview cleaned data\n",
    "print(products.head(20))\n",
    "print(products.info())\n",
    "\n",
    "# ========================\n",
    "# 1a. SAVE CLEANED DATA TO CSV\n",
    "# ========================\n",
    "products.to_csv(\n",
    "    r\"D:\\CERTIFICATIONS\\GUVI\\Capestone Project -2 (Spark BI)\\Cleaned CSV\\Products_Cleaned.csv\",\n",
    "    index=False,\n",
    "    encoding='utf-8',\n",
    "    na_rep=\"\"\n",
    ")\n",
    "\n",
    "print(\"✅ Products data saved to cleaned CSV!\")\n",
    "\n",
    "# ========================\n",
    "# 2. SQL SERVER CONNECTION (SSMS)\n",
    "# ========================\n",
    "conn = pyodbc.connect(\n",
    "    \"Driver={ODBC Driver 17 for SQL Server};\"\n",
    "    \"Server=DESKTOP-OO5HFAI\\\\SQLEXPRESS;\"\n",
    "    \"Database=Data_Spark;\"\n",
    "    \"Trusted_Connection=yes;\"\n",
    ")\n",
    "\n",
    "cursor = conn.cursor()\n",
    "\n",
    "# ========================\n",
    "# 3. INSERT DATA INTO SQL SERVER\n",
    "# ========================\n",
    "insert_query = \"\"\"\n",
    "INSERT INTO Products \n",
    "(ProductKey, [Product Name], Brand, Color, [Unit Cost USD], [Unit Price USD], \n",
    " SubcategoryKey, Subcategory, CategoryKey, Category)\n",
    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\n",
    "\"\"\"\n",
    "\n",
    "for _, row in products.iterrows():\n",
    "    cursor.execute(insert_query, (\n",
    "        int(row['ProductKey']) if str(row['ProductKey']).isdigit() else None,\n",
    "        row['Product Name'],\n",
    "        row['Brand'],\n",
    "        row['Color'],\n",
    "        row['Unit Cost USD'],    # already cleaned to float/None\n",
    "        row['Unit Price USD'],   # already cleaned to float/None\n",
    "        int(row['SubcategoryKey']) if str(row['SubcategoryKey']).isdigit() else None,\n",
    "        row['Subcategory'],\n",
    "        int(row['CategoryKey']) if str(row['CategoryKey']).isdigit() else None,\n",
    "        row['Category']\n",
    "    ))\n",
    "\n",
    "conn.commit()\n",
    "cursor.close()\n",
    "conn.close()\n",
    "\n",
    "print(\"✅ Products data inserted into SQL Server (SSMS) successfully!\")\n",
    "\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "37361419",
   "metadata": {},
   "source": [
    "## Sales Table Data Cleaning and save as CSV and load to SSMS"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "b1921b7d",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "✅ Cleaned Sales CSV saved successfully!\n",
      "✅ Cleaned Sales data inserted into SQL Server successfully!\n"
     ]
    }
   ],
   "source": [
    "import pandas as pd\n",
    "from datetime import datetime\n",
    "import pyodbc\n",
    "\n",
    "# ========================\n",
    "# 1. LOAD & CLEAN SALES CSV\n",
    "# ========================\n",
    "sales = pd.read_csv(\n",
    "    r\"D:\\CERTIFICATIONS\\GUVI\\Capestone Project -2 (Spark BI)\\Sales.csv\",\n",
    "    encoding='latin1',\n",
    "    keep_default_na=False\n",
    ")\n",
    "\n",
    "# ========================\n",
    "# 2. FUNCTION TO PARSE DATES\n",
    "# ========================\n",
    "def parse_date(date_str):\n",
    "    if pd.isna(date_str) or date_str == \"\":\n",
    "        return None\n",
    "    for fmt in (\"%d-%m-%Y\", \"%m-%d-%Y\", \"%d/%m/%Y\", \"%m/%d/%Y\", \"%Y-%m-%d\"):\n",
    "        try:\n",
    "            return datetime.strptime(str(date_str).strip(), fmt)\n",
    "        except ValueError:\n",
    "            continue\n",
    "    return None  # if nothing works\n",
    "\n",
    "# ========================\n",
    "# 3. APPLY DATE PARSER\n",
    "# ========================\n",
    "sales['Order Date'] = sales['Order Date'].apply(parse_date)\n",
    "sales['Delivery Date'] = sales['Delivery Date'].apply(parse_date)\n",
    "\n",
    "# ========================\n",
    "# 3a. REPLACE NULL DELIVERY DATE WITH ORDER DATE\n",
    "# ========================\n",
    "sales['Delivery Date'] = sales.apply(\n",
    "    lambda row: row['Order Date'] if pd.isna(row['Delivery Date']) else row['Delivery Date'],\n",
    "    axis=1\n",
    ")\n",
    "\n",
    "# ========================\n",
    "# 4. FORMAT DATES FOR CSV\n",
    "# ========================\n",
    "sales_csv = sales.copy()\n",
    "sales_csv['Order Date'] = sales_csv['Order Date'].apply(\n",
    "    lambda x: x.strftime('%d-%m-%Y') if pd.notna(x) else \"\"\n",
    ")\n",
    "sales_csv['Delivery Date'] = sales_csv['Delivery Date'].apply(\n",
    "    lambda x: x.strftime('%d-%m-%Y') if pd.notna(x) else \"\"\n",
    ")\n",
    "\n",
    "# ========================\n",
    "# 5. SAVE CLEANED CSV\n",
    "# ========================\n",
    "sales_csv.to_csv(\n",
    "    r\"D:\\CERTIFICATIONS\\GUVI\\Capestone Project -2 (Spark BI)\\Cleaned CSV\\Sales_Cleaned.csv\",\n",
    "    index=False,\n",
    "    encoding='utf-8',\n",
    "    na_rep=\"\"\n",
    ")\n",
    "\n",
    "print(\"✅ Cleaned Sales CSV saved successfully!\")\n",
    "\n",
    "# ========================\n",
    "# 6. INSERT CLEANED DATA INTO SQL SERVER\n",
    "# ========================\n",
    "conn = pyodbc.connect(\n",
    "    \"Driver={ODBC Driver 17 for SQL Server};\"\n",
    "    \"Server=DESKTOP-OO5HFAI\\\\SQLEXPRESS;\"\n",
    "    \"Database=Data_Spark;\"\n",
    "    \"Trusted_Connection=yes;\"\n",
    ")\n",
    "\n",
    "cursor = conn.cursor()\n",
    "\n",
    "insert_query = \"\"\"\n",
    "INSERT INTO Sales\n",
    "([Order Number], [Line Item], [Order Date], [Delivery Date],\n",
    " CustomerKey, StoreKey, ProductKey, Quantity, [Currency Code])\n",
    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)\n",
    "\"\"\"\n",
    "\n",
    "for _, row in sales.iterrows():\n",
    "    cursor.execute(insert_query, (\n",
    "        row['Order Number'],\n",
    "        row['Line Item'],\n",
    "        row['Order Date'].date() if pd.notna(row['Order Date']) else None,\n",
    "        row['Delivery Date'].date() if pd.notna(row['Delivery Date']) else None,\n",
    "        row['CustomerKey'],\n",
    "        row['StoreKey'],\n",
    "        row['ProductKey'],\n",
    "        row['Quantity'],\n",
    "        row['Currency Code']\n",
    "))\n",
    "\n",
    "conn.commit()\n",
    "cursor.close()\n",
    "conn.close()\n",
    "\n",
    "print(\"✅ Cleaned Sales data inserted into SQL Server successfully!\")\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fa6feb98",
   "metadata": {},
   "source": [
    "## Stores Table Data Cleaning and save as CSV and load to SSMS"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 35,
   "id": "7fa93d72",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "    StoreKey    Country                         State Square Meters  \\\n",
      "0          1  Australia  Australian Capital Territory           595   \n",
      "1          2  Australia            Northern Territory           665   \n",
      "2          3  Australia               South Australia          2000   \n",
      "3          4  Australia                      Tasmania          2000   \n",
      "4          5  Australia                      Victoria          2000   \n",
      "5          6  Australia             Western Australia          2000   \n",
      "6          7     Canada                 New Brunswick          1105   \n",
      "7          8     Canada     Newfoundland and Labrador          2105   \n",
      "8          9     Canada         Northwest Territories          1500   \n",
      "9         10     Canada                       Nunavut          1210   \n",
      "10        11     Canada                         Yukon          1210   \n",
      "11        12     France               Basse-Normandie           350   \n",
      "12        13     France                         Corse           245   \n",
      "13        14     France                 Franche-Comté           350   \n",
      "14        15     France                    La Réunion           400   \n",
      "15        16     France                      Limousin           385   \n",
      "16        17     France                    Martinique           350   \n",
      "17        18     France                       Mayotte           310   \n",
      "18        19    Germany                        Berlin          1295   \n",
      "19        20    Germany                   Brandenburg          1715   \n",
      "\n",
      "     Open Date  \n",
      "0   01-01-2008  \n",
      "1   01-12-2008  \n",
      "2   01-07-2012  \n",
      "3   01-01-2010  \n",
      "4   12-09-2015  \n",
      "5   01-01-2010  \n",
      "6   05-07-2007  \n",
      "7   07-02-2014  \n",
      "8   03-04-2005  \n",
      "9   04-04-2015  \n",
      "10  06-03-2009  \n",
      "11  06-06-2012  \n",
      "12  06-07-2013  \n",
      "13  15-12-2009  \n",
      "14  01-01-2015  \n",
      "15  06-03-2010  \n",
      "16  07-08-2007  \n",
      "17  08-08-2012  \n",
      "18  04-04-2015  \n",
      "19  15-12-2012  \n",
      "<class 'pandas.core.frame.DataFrame'>\n",
      "RangeIndex: 67 entries, 0 to 66\n",
      "Data columns (total 5 columns):\n",
      " #   Column         Non-Null Count  Dtype \n",
      "---  ------         --------------  ----- \n",
      " 0   StoreKey       67 non-null     int64 \n",
      " 1   Country        67 non-null     object\n",
      " 2   State          67 non-null     object\n",
      " 3   Square Meters  67 non-null     object\n",
      " 4   Open Date      67 non-null     object\n",
      "dtypes: int64(1), object(4)\n",
      "memory usage: 2.7+ KB\n",
      "None\n",
      "✅ Cleaned Stores CSV saved successfully!\n",
      "✅ Cleaned Stores data inserted into SQL Server successfully!\n"
     ]
    }
   ],
   "source": [
    "import pandas as pd\n",
    "from datetime import datetime\n",
    "import pyodbc  # ✅ using pyodbc for SQL Server\n",
    "\n",
    "# ========================\n",
    "# 1. LOAD STORES CSV WITH UTF-8\n",
    "# ========================\n",
    "stores = pd.read_csv(\n",
    "    r\"D:\\CERTIFICATIONS\\GUVI\\Capestone Project -2 (Spark BI)\\Stores.csv\",\n",
    "    encoding='utf-8',\n",
    "    keep_default_na=False\n",
    ")\n",
    "\n",
    "# ========================\n",
    "# 2. FUNCTION TO PARSE DATES\n",
    "# ========================\n",
    "def parse_date(date_str):\n",
    "    if pd.isna(date_str) or date_str == \"\":\n",
    "        return None\n",
    "    for fmt in (\"%d-%m-%Y\", \"%m-%d-%Y\", \"%d/%m/%Y\", \"%m/%d/%Y\", \"%Y-%m-%d\"):\n",
    "        try:\n",
    "            return datetime.strptime(str(date_str).strip(), fmt)\n",
    "        except ValueError:\n",
    "            continue\n",
    "    return None  # if nothing works\n",
    "\n",
    "# ========================\n",
    "# 3. CLEAN OPEN DATE\n",
    "# ========================\n",
    "stores['Open Date'] = stores['Open Date'].apply(parse_date)\n",
    "\n",
    "# Format as string \"DD-MM-YYYY\" for CSV\n",
    "stores_csv = stores.copy()\n",
    "stores_csv['Open Date'] = stores_csv['Open Date'].apply(\n",
    "    lambda x: x.strftime('%d-%m-%Y') if pd.notna(x) else \"\"\n",
    ")\n",
    "\n",
    "# ✅ Preview cleaned data\n",
    "print(stores_csv.head(20))\n",
    "print(stores_csv.info())\n",
    "\n",
    "# ========================\n",
    "# 4. SAVE CLEANED CSV\n",
    "# ========================\n",
    "stores_csv.to_csv(\n",
    "    r\"D:\\CERTIFICATIONS\\GUVI\\Capestone Project -2 (Spark BI)\\Cleaned CSV\\Stores_Cleaned.csv\",\n",
    "    index=False,\n",
    "    encoding='utf-8',\n",
    "    na_rep=\"\"\n",
    ")\n",
    "\n",
    "print(\"✅ Cleaned Stores CSV saved successfully!\")\n",
    "\n",
    "# ========================\n",
    "# 5. INSERT CLEANED DATA INTO SQL SERVER\n",
    "# ========================\n",
    "conn = pyodbc.connect(\n",
    "    \"Driver={ODBC Driver 17 for SQL Server};\"\n",
    "    \"Server=DESKTOP-OO5HFAI\\\\SQLEXPRESS;\"\n",
    "    \"Database=Data_Spark;\"\n",
    "    \"Trusted_Connection=yes;\"\n",
    ")\n",
    "\n",
    "cursor = conn.cursor()\n",
    "\n",
    "insert_query = \"\"\"\n",
    "INSERT INTO Stores\n",
    "(StoreKey, Country, State, [Square Meters], [Open Date])\n",
    "VALUES (?, ?, ?, ?, ?)\n",
    "\"\"\"\n",
    "\n",
    "for _, row in stores.iterrows():\n",
    "    cursor.execute(insert_query, (\n",
    "        row['StoreKey'],\n",
    "        row['Country'],\n",
    "        row['State'],\n",
    "        row['Square Meters'],\n",
    "        row['Open Date'].date() if pd.notna(row['Open Date']) else None\n",
    "    ))\n",
    "\n",
    "conn.commit()\n",
    "cursor.close()\n",
    "conn.close()\n",
    "\n",
    "print(\"✅ Cleaned Stores data inserted into SQL Server successfully!\")\n"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.13.1"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}


2. **Data Management (SQL Server)**  
   - Created relational tables for Customers, Products, Sales, Stores, Exchange Rates  
   - Loaded cleaned datasets into SQL Server  
   - Designed SQL queries for KPIs & business questions  

3. **Visualization (Power BI)**  
   - Connected SQL database to Power BI  
   - Built **interactive dashboards** with drill-through, filters, KPIs, and advanced DAX measures  

---

## 📊 Dashboards  

### 🔹 **1. Performance Dashboard**  
- KPIs: Customers, Orders, Revenue, Profit, AOV  
- **Category Revenue Performance** (Pie Chart)  
- **Annual Order Trends** (Line Chart with moving averages)  
- **Category → Product Revenue Breakdown** (Bar Chart)
  
![](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/SCREENSHOTS%20OF%20DASHBOARD/Screenshot%20(83).png)  

### 🔹 **2. Customer Analysis Dashboard**  
- KPIs: Total Customers, Male/Female Split, Avg. Age, Retention Rate  
- **Brand-wise Customer Distribution** (Bar Chart)  
- **Customer Demographics** by Continent, Country, State, City  
- **Customer Distribution Table** (Subcategory, Quantity, Customers)  
- **Customer CLV Table** with Order details
  
![](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/SCREENSHOTS%20OF%20DASHBOARD/Screenshot%20(84).png)  

### 🔹 **3. Sales Analysis Dashboard**  
- KPIs: Sales, Profit, Orders, Gross Margin %, On-time Delivery %  
- **Revenue Distribution Across Age Groups** (Donut Chart)  
- **Annual Sales & Profit Trends** (Line Chart)  
- **Category Sales & Profit Breakdown** (Bar Chart)  
- **Geographic Revenue Distribution (Continent → City)** (Map)
  
![](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/SCREENSHOTS%20OF%20DASHBOARD/Screenshot%20(86).png)  

### 🔹 **4. Product Analysis Dashboard**  
- KPIs: Products, Top Product, Top Product Revenue  
- **Top Sold Products** (Dynamic Top-N with parameter slider)  
- **Product Profit Performance** (Funnel Chart)  
- **Product Order Trends** (Pie Chart)  
- **Global Product Order Trends** (Map)
  
![](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/SCREENSHOTS%20OF%20DASHBOARD/Screenshot%20(87).png)  

### 🔹 **5. Store Analysis Dashboard**  
- KPIs: Stores, Store Revenue, Store Profit, Avg. Order Value  
- **Geographical Store Count** (Tree Map)  
- **Stores Across Geographies** (Map → drill-down Continent → City)  
- **Store Overall Sales Performance** (Table with revenue, orders, margin)  
- **Store-based Product Order Trends** (Multi-Card)
  
![](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/SCREENSHOTS%20OF%20DASHBOARD/Screenshot%20(88).png)  

---

## 📌 Key Insights
![](https://github.com/BERLINSAMUELRAJ/DATASPARK_PROJECT/blob/main/Customer-Journey-Map-Diagram-Brainstorm-1024x576.webp)

- **Customer Behavior:** Balanced male-female split, strong retention (~61%)  
- **Sales Trends:** Peak in 2019, drop post-2020  
- **Products:** Computers dominate revenue, while Games & Toys underperform  
- **Stores:** USA & Online channels drive majority of sales  
- **Currency:** Exchange rates impact international sales performance  

---

## 🧾 Deliverables  
- ✔️ Cleaned & integrated datasets  
- ✔️ SQL queries for KPIs  
- ✔️ Power BI dashboards for **Customers, Sales, Products, and Stores**  
- ✔️ Actionable recommendations to improve marketing, product strategy, and operations  

---

## 📅 Timeline  
- Data Cleaning & SQL Setup → **2 days**  
- Dashboard Development → **3 days**  
- Insights & Documentation → **2 days**  

---

## 📌 References  
- [Exploratory Data Analysis Guide](https://docs.google.com/document/d/1tHiTU1X9UwXSLySpJ-FVCohlf_8xpXwa75vlK9S6wl8/edit?usp=sharing)  
- [Power BI Session Recordings](https://drive.google.com/drive/folders/1Ag9pAbXmPtBVz6pDHa_yGI_wzK61TTao?usp=sharing)  

---

✅ With these dashboards, **Global Electronics leadership can track KPIs, drill into geographies, monitor product profitability, and optimize store strategies in real time.**
