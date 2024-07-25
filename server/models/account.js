const mongoose = require('mongoose');

const validateEmail = (email) => {
    const regex = /^\S+@\S+\.\S+$/; // Basic email format validation
    return regex.test(email);
};


const accountSchema = mongoose.Schema({
    personalInfo: {
        fullName : {
            type: String,
            required: [true, "can't be blank"], 
            trim: true,
            index: true
        },
        dateOfBirth: {
            type: String,
            required: [true, "can't be blank"],
        },
        gender: {
            type: String,
            required: true
        },
        nationality: { 
            type: String, 
            required: true
         },
        residentialAddress: { 
            type: String, 
            required: true 
        },
        contactInfo: {
          phoneNumber: { 
            type: String,
            required: true
          },
          email: {
            type: String,
            required: [true, "Email is required"],
            unique: true,
            lowercase: true, 
            trim: true, 
            validate: [validateEmail, 'Please enter a valid email address'],
            },
        },
    },
    employmentInfo: {
        employmentStatus: { 
            type: String 
        },
        employerName: { 
            type: String 
        },
        jobTitle: { 
            type: String 
        },
        monthlyIncome: { 
            type: Number 
        },
    },
    financialInfo: {
        annualIncome: { 
            type: Number,
            required: true,
         },
        sourceOfIncome: { 
            type: String
         },
    },
    accountDetails: {
        accountNumber: { 
            type: String, 
            required: true
         },
        accountType: { 
            type: String,
            required: true
         },
        accountOpeningDate: { 
            type: String, 
            default: Date.now
         },
        accountBalance: { 
            type: Number, 
            required: true,
            default: 0
         },
    },
    transactionHistory: [{
        type: {
            type: String
        },
        amount: { type: Number },
        timestamp: { type: String, default: Date.now },
        payee: { type: String },
        payer: { type: String },
    }],
});

const Account = mongoose.model('Accounts', accountSchema);
module.exports = Account;