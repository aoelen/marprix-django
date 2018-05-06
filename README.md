# README Marprice

![Logo](marprix/marketplace/static/marketplace/img/logo_small.png)

> ** ICT4D Group 2**
> - Mathijs Oggel
> - Nip van Wees
> - Tom Tol
> - Allard Oelen

## Introduction
Marprice provides farmers in rural areas of Africa the most recent market prices. Marprice offers both the front-end and back-end. In the back-end products can be added, delete or product prices can be updated. The front-end can be accessed from both a web interface and via a voice interface. The full version working version of this application can be accessed via: http://marprice.herokuapp.com/

_The names Marprice and Marprix are used interchangeably. Both the names refer to the same application._

## Installation requirements
- Python 3.6 or higher
- Django 2
- Postgresql
- No internet connection required

## Installation manual
Local installation (make sure to have Python and Django installed first, optionally work in a virtual environment)
1. `$ git clone https://github.com/aoelen/marprix-django`
2. Install the required packages: `$ pip install -r requirements.txt`
3. Import the database: `$ psql mydatabase < database.sql` (replace mydatabase by your database name)
4. Change the database settings in: `marprix/marprix/settings.py`
4. Run the server: `$ python marprix/manage.py runserver`
5. Visit Marprice at: `http://localhost:8000`

# Prices web interface

# Prices voice interface

# Market leader housekeeping
