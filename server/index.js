const express = require('express')
const mongoose = require('mongoose')
require('dotenv').config()

const accountRouter = require('./routes/account');
const userRouter = require('./routes/user');

const app = express()

app.use(express.json())
app.use(accountRouter);
app.use(userRouter);

const PORT = process.env.PORT || 4520

app.listen(PORT, "0.0.0.0", ()=>{
    console.log(`Connected to port ${PORT}`)
})

const DB = process.env.MONGODB_URI

// Connection to database 
mongoose.set('strictQuery', true);
mongoose.connect(DB).then(()=>console.log("Connected to Database successfully!")).catch((e)=>console.log(e));