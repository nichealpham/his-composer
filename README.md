<h1 align="center">
  <a href="https://a2ds.io/"><img src="https://uploads-ssl.webflow.com/5e16e935ef00e719b76c570a/5e17f43acf33867cdb70d545_logo.png" alt="Markdownify" width="200"></a>
  <br>
  <span style="font-size:50px">HIS Composer</span>
  <br>
  <br>
  <a href="https://www.youtube.com/watch?v=YXcC-purj9E">
  <img src="https://github.com/nichealpham/his-composer/blob/main/public/banner.jpg?raw=true" alt="Image Logo">
</a>
  <br>
  <br>
</h1>
<p align="center" style="margin-top:20px">
  <img src="https://raw.githubusercontent.com/8bithemant/8bithemant/master/svg/dev/languages/csharp.svg"alt="Twitter" style="vertical-align:top; margin:4px" height="25px">
  <img src="https://raw.githubusercontent.com/8bithemant/8bithemant/master/svg/dev/frameworks/vue.svg" alt="Twitter" style="vertical-align:top; margin:4px" height="25px">
  <img src="https://raw.githubusercontent.com/8bithemant/8bithemant/master/svg/dev/languages/html.svg" alt="Twitter" style="vertical-align:top; margin:4px" height="25px">
  <img src="https://raw.githubusercontent.com/8bithemant/8bithemant/master/svg/dev/languages/js.svg" alt="Twitter" style="vertical-align:top; margin:4px" height="25px">
  <img src="https://raw.githubusercontent.com/8bithemant/8bithemant/master/svg/dev/services/npm.svg" alt="Twitter" style="vertical-align:top; margin:4px" height="25px">
  <img src="https://raw.githubusercontent.com/8bithemant/8bithemant/master/svg/dev/services/gcp.svg" alt="Twitter" style="vertical-align:top; margin:4px" height="25px">
  <img src="https://raw.githubusercontent.com/8bithemant/8bithemant/master/svg/dev/tools/visualstudio_code.svg" alt="Twitter" style="vertical-align:top; margin:4px" height="25px">
</p>

<h2 align="center">Docker compose for running an Open version of <a href="https://www.who.int/healthinfo/statistics/toolkit_hss/EN_PDF_Toolkit_HSS_InformationSystems.pdf">HIS</a></br> (Health Information System)
<br/>
<br/>

<p align="center">
  • <a href="https://www.youtube.com/watch?v=YXcC-purj9E">Video demonstration</a>
</p>
<p align="center">
  • <a href="#key-features">Key Features</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#download">Download</a> •
  <a href="#credits">Credits</a> •
  <a href="#related">Related</a> •
  <a href="#license">License</a>
</p>

# Modules

* ✔️ Patient Admission System (PAS) 
* ✔️ Eletronic Medical Record (EMR)
* ✔️ Human Resource Management (Admin)
* ⚡ AI Analysis for Fundus and Dry Eye (Beta)

# About
This product is an IT platform dedicated for Hospital and Clinics management, consiting of 3 principal modules:

<img align="right" src="https://github.com/nichealpham/his-composer/blob/main/public/admin.png?raw=true" vspace="0" width="360" />

**✔️ 1. PAS - Patient Admission System**
- Managing patient profiles
- Booking appointment
- Admit patient into EMR system
- Accepting payments, export invoices and payment receipts
- High performance and thorough Reporting system
<br/>
<br/>


---
<br/>
<img align="right" src="https://github.com/nichealpham/his-composer/blob/main/public/pas.png?raw=true" vspace="0" width="360" />

**✔️ 2. EMR - Electronic Medical Record**
- Medical Forms for doctor to perform examination
- Data collection and Episode Manegemnt for each patients visits
- Scalable Archetype design to extend to different medical fields
- Medicine and Medication management system
- Patient Visits and Discharge Summary management
<br/>
<br/>

---
<br/>
<img align="right" src="https://github.com/nichealpham/his-composer/blob/main/public/emr.png?raw=true" vspace="0" width="360" />

**✔️ 3. Admin - Internal Organzation Management**
- Management of hospital's Human resources
- Management of Branding and satlite Clinics
- Complete customization of available Medical Services
- Doctor Roster and Scheduling System

<br/>

---
<br/>
<img align="right" src="https://github.com/nichealpham/his-composer/blob/main/public/ai.png?raw=true" vspace="0" width="360" />

**⚡ 4. A2DS - AI Assisted Diagnosis System (beta)**
- Dry Eye detection algorithm
- Fundus Lesion detection algorithm
- Analysis and Flow management
<br/>
<br/>
<br/>


# How To Use

## 1. Run using docker compose
A complete, Open version of the platform is ready to use with the following commands:

```bash
# Clone this repository
$ git clone https://github.com/nichealpham/his-composer.git

# Go into the repository
$ cd his-composer

# Run the app
$ docker-compose up -d
```

Then navigate to the following URL:
1. [http://localhost:3001](http://localhost:3001): Admin
2. [http://localhost:3002](http://localhost:3002): PAS
3. [http://localhost:3003](http://localhost:3003): EMR

Default Root account:
* Username: `root`
* Password: `Admin@123#`

## 2. Modify the Default SQL Password

You can update the default MSSQL Password by changing the following sections:
1. In `docker-compose.yml` file, update line `- SA_PASSWORD=[Your new password...]`
2. In `api.env` file, update line `HIS_APP_MSSQL_DB_PASSWORD=[Your new password...]`

Then rebuild and run the system:
```
docker-compose up --build -d
```

## 3. Hosting the frontend via a reverse proxy

We highly recomdend you should be familiar with how to setup a reverse proxy for the application, for example with `nginx`.

For fontend website to successfully call Backend APIs, modify the following URLs inside `web.env` file:
```
HIS_APP_API_AUTHEN=http://localhost:2001/api
HIS_APP_API_BOOKING=http://localhost:2002/api
HIS_APP_API_EMR=http://localhost:2003/api
HIS_APP_API_HR=http://localhost:2004/api
HIS_APP_API_PAS=http://localhost:2005/api
HIS_APP_API_SIGNAL=http://localhost:2006/signal
HIS_APP_API_FUNCTION=http://localhost:2999/graphql
HIS_APP_API_ORTHANC=http://localhost:8042
```

Then rebuild and run the system:

```
docker-compose up --build -d
```

# Credits

This software is made by these technologies:

- [.NET Core](https://dotnet.microsoft.com/)
- [SQL Server](https://www.microsoft.com/en-us/sql-server)
- [Appolo GraphQL](https://www.apollographql.com/)
- [Vue.js](https://vuejs.org/)

# Support

💪 We are looking for business collaboration to extend the impact of this product and to validate its functionalities for international standards. Please contact us for future opportunities:

<h3>⭐ Contact Information</h3>
Name:  NICHEAL PHAM<br/>
Technical Solution Architect at A2DS, Inc. <br/>
Email: nguyen@a2ds.io<br/>
Linkedin: https://www.linkedin.com/in/nichealpham/<br/>

****

# License

MIT

---
With 💙 from [@Nicheal Pham](https://github.com/nichealpham)

