# README Marprice

![Logo](marprix/marketplace/static/marketplace/img/logo_small.png)

> **ICT4D Group 2**
> - Mathijs Oggel
> - Nip van Wees
> - Tom Tol
> - Allard Oelen

## 1. Introduction
Marprice provides farmers in rural areas of Africa the most recent market prices. Marprice offers both the front-end and back-end. In the back-end products can be added, delete or product prices can be updated. The front-end can be accessed from both a web interface and via a voice interface. The full version working version of this application can be accessed via: http://marprice.herokuapp.com/

_The names Marprice and Marprix are used interchangeably. Both the names refer to the same application._

## 2. Installation requirements
- Python 3.6 or higher
- Django 2
- Postgresql
- No internet connection required

## 3. Installation instructions
Local installation (make sure to have Python and Django installed first, optionally work in a virtual environment)
- `$ git clone https://github.com/aoelen/marprix-django`
 - (Optionally create a virtual environment using: `$ virtualenv venv`)
 - (Optionally activate the environment: `$ source venv/bin/activate`)
- Install the required packages: `$ pip install -r requirements.txt`
- Import the database: `$ psql mydatabase < database.sql` (replace mydatabase by your database name) - or - import the database using your own preferred method 
- Change the database settings in: `marprix/marprix/settings.py` (starts on line 77)
- Run the server: `$ python marprix/manage.py runserver`
- Visit Marprice at: `http://localhost:8000`

## 4. Application functionality
In this section, the functionality of Marprice is briefly explained. For a detailed description of this application, please have a look at our project report

### 4.1 Prices web interface
Link: http://marprice.herokuapp.com/ This web interfaced can be accessed by farmers, to check out the latest market prices. The categories, products and prices are loaded from the database. Each product is related to a unit, since each product has its own measurement unit.

### 4.2 Prices voice interface
Link: http://marprice.herokuapp.com/VXML/welcome Since the application is mainly designed for use in rural Africa, the voice interface is the most prominent part of Marprice. The voice interface provides an intuitive way of requesting product pricing using DTMF menus. Since Text-To-Speech (TTS) is not always available/reliable, all the audio files are stored locally. This also ensures that Marprice can work without an internet connection. In all voice menus, their is an option to go back to the previous action in order to ensure that user errors can be recovered.

#### 4.2.1 Welcome & History
Farmers are welcomed when they call Marprice for the first time. If they requested a product price before, they can request the last requested price (a full product history per phone number is stored in the database)

#### 4.2.2 Request product per ID
If a farmer is already familiar with the system, they can enter their product ID directly in Marprice. This saves time, since they can skip the category and product selection.

#### 4.2.3 Product categories & product selection
In the product categories menu, farmers can select a category from the product they are looking for. The categories are dynamically loaded from the database. After a category has been selected, products can be selected. After a product is selected, the price and unit are provided. In addition to this, the selection is saved to the database for both statistics and the history functionality.

### 4.3 Market leader housekeeping
Link: http://marprice.herokuapp.com/market-leader Via this interface, a market leader (or NGO) can enter the latest prices, add products or delete products.

## 5. Application code
Since this application is built using the Django web framework, some code in this repository is needed for Django and is not very interesting to look into. The most important file is: `marprix/marketplace/views.py`. In this file the views are defined, also the functions in this file are commented.
