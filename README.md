<h1 align="center">
  <a href="https://gramme.io/cassand"><img src="https://nichealpham.github.io/Cassandra-project/public/images/startup.png" alt="Markdownify" width="160"></a>
  <br>
  <span style="font-size:120px">HIS Composer</span>
  <br>
  <br>
  <a href="https://www.youtube.com/watch?v=DjqP67_SnsY&t=335s">
  <img src="https://github.com/nichealpham/his-composer/blob/main/public/banner.jpg?raw=true" alt="Image Logo">
  </a>
  <br/>
  <br/>
  🔥 <a href="https://www.youtube.com/watch?v=DjqP67_SnsY&t=335s">Video Introduction</a> 🔥
  </p>
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
  Quick Demo Links:
  • <a href="http://118.69.43.145:1012/">EMR</a>
  • <a href="http://118.69.43.145:1011/">PAS</a>
  • <a href="http://118.69.43.145:1010/">ADMIN</a>
</p>
<p align="center">
  ( Account: test |
  Password: 123456 )
</p>
<p align="center">
  • <a href="#modules">Modules</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#credits">Credits</a> •
  <a href="#support">Support</a> •
  <a href="#license">License</a>
</p>

# Modules

- ✔️ Patient Admission System (PAS)
- ✔️ Eletronic Medical Record (EMR)
- ✔️ Human Resource Management (Admin)
- ⚡ AI Analysis for Fundus and Dry Eye (Beta)

# About

This product is an IT platform dedicated for Hospital and Clinics management, consiting of 3 principal modules:

<img align="right" src="https://github.com/nichealpham/his-composer/blob/main/public/pas.png?raw=true" vspace="0" width="460" />

**✔️ 1. PAS - Patient Admission System**

- Managing patient profiles
- Booking appointment
- Admit patient into EMR system
- Accepting payments, export invoices and payment receipts
- High performance and thorough Reporting system
  <br/>

---

<img align="right" src="https://github.com/nichealpham/his-composer/blob/main/public/emr.png?raw=true" vspace="0" width="460" />

**✔️ 2. EMR - Electronic Medical Record**

- Medical Forms for doctor to perform examination
- Data collection and Episode Manegemnt for each patients visits
- Scalable Archetype design to extend to different medical fields
- Medicine and Medication management system
- Patient Visits and Discharge Summary management

---

<img align="right" src="https://github.com/nichealpham/his-composer/blob/main/public/admin.png?raw=true" vspace="0" width="460" />

**✔️ 3. Admin - Internal Organzation Management**

- Management of hospital's Human resources
- Management of Branding and satlite Clinics
- Complete customization of available Medical Services
- Doctor Roster and Scheduling System
  <br/>

---

<img align="right" src="https://github.com/nichealpham/his-composer/blob/main/public/ai.png?raw=true" vspace="0" width="460" />

**⚡ 4. A2DS - AI Assisted Diagnosis System (beta)**

- Dry Eye detection algorithm
- Fundus Lesion detection algorithm
- Analysis and Flow management
  <br/>
  <br/>

# How To Use

## Run using docker compose 🌈

A complete version of the platform is ready to use with docker compose:

```bash
# Clone this repository
$ git clone https://github.com/nichealpham/his-composer.git

# Go into the repository
$ cd his-composer
```

### Check the ip adress of your system

```bash
$ ipconfig
$ ifconfig
```

### Then, replace the IP address in the appropriate place inside .env file

```bash
SA_PASSWORD=Admin@123#
HIS_APP_MSSQL_DB_HOST=172.25.229.39
HIS_APP_MSSQL_DB_USER=sa
HIS_APP_MSSQL_DB_PASSWORD=Admin@123#
HIS_APP_ACCESS_TOKEN_ENCRYPTION_KEY=sandrasoft@2021#
VUE_APP_API=http://172.25.229.39:2001/api
VUE_APP_AI_FUNCTIONS=http://172.25.229.39:2002/graphql
```

## Run the app

```bash
$ docker-compose up -d
```

Then navigate to the following URL:

1. [http://localhost:3001](http://localhost:3001): Admin
2. [http://localhost:3002](http://localhost:3002): PAS
3. [http://localhost:3003](http://localhost:3003): EMR

Default Root account:

- Username: `root`
- Password: `Admin@123#`

# Credits

This software is made by these technologies:

- [.NET Core](https://dotnet.microsoft.com/)
- [SQL Server](https://www.microsoft.com/en-us/sql-server)
- [Appolo GraphQL](https://www.apollographql.com/)
- [Vue.js](https://vuejs.org/)

# Support

💪 We are looking for business collaboration to extend the impact of this product and to validate its functionalities for international standards. Please contact us for any opportunities 🔥

<h3>⭐ Contact Information</h3>
Name:  Nicheal Pham<br/>
Technical Solution Architect at A2DS, Inc. <br/>
Email: nichealpham@gmail.com<br/>
Linkedin: https://www.linkedin.com/in/nichealpham/<br/>
Phone: +84-914-118-896

---

# License

MIT

---

With 💙 from [@Nicheal Pham](https://github.com/nichealpham)


### Infrastructure model

![Infrastructure model](.infragenie/infrastructure_model.png)