const express = require('express');
const accountRouter = express.Router();
const Account = require('../models/account');

accountRouter.post('/api/create-account', async(req, res)=>{
    try{
        const accountNumber = req.body["accountDetails"]["accountNumber"];
        const email = req.body["personalInfo"]["contactInfo"]["email"];
        const existingAccount = await Account.findOne({
            'accountDetails.accountNumber': accountNumber,
        });
        const existingEmail = await Account.findOne({
            'personalInfo.contactInfo.email': email,
        });
        if(existingAccount ) {
            return res.json({ msg:'Account with same account number is already exists!' })
        }
        if(existingEmail) {
            return res.json({ msg:'Account with same email is already exists!' })
        }
        let account = new Account({
            personalInfo : {
                fullName: req.body["personalInfo"]["fullName"],
                dateOfBirth: req.body["personalInfo"]["dateOfBirth"],
                gender: req.body["personalInfo"]["gender"],
                nationality: req.body["personalInfo"]["nationality"],
                residentialAddress: req.body["personalInfo"]["residentialAddress"],
                contactInfo: {
                    phoneNumber: req.body["personalInfo"]["contactInfo"]["phoneNumber"],
                    email: req.body["personalInfo"]["contactInfo"]["email"]
                }
            },
            employmentInfo: {
                employmentStatus: req.body["employmentInfo"]["employmentStatus"],
                employerName: req.body["employmentInfo"]["employerName"],
                jobTitle: req.body["employmentInfo"]["jobTitle"],
                monthlyIncome: req.body["employmentInfo"]["monthlyIncome"],
            },
            financialInfo: {
                annualIncome: req.body["financialInfo"]["annualIncome"],
                sourceOfIncome: req.body["financialInfo"]["sourceOfIncome"]
            },
            accountDetails: {
                accountNumber: req.body["accountDetails"]["accountNumber"],
                accountType: req.body["accountDetails"]["accountType"],
                accountOpeningDate: req.body["accountDetails"]["accountOpeningDate"],
                accountBalance: req.body["accountDetails"]["accountBalance"]
            },
            transactionHistory: [
                {
                    type: req.body["transactionHistory"][0]["type"],
                    amount: req.body["transactionHistory"][0]["amount"],
                    timestamp: req.body["transactionHistory"][0]["timestamp"],
                    payee: req.body["transactionHistory"][0]["payee"],
                    payer: req.body["transactionHistory"][0]["payer"],
                }
            ]
        });
        account = await account.save();
        res.status(200).json(account);
    } catch(e) {
        res.status(500).json({ error: e.message });
    }
})

module.exports = accountRouter;