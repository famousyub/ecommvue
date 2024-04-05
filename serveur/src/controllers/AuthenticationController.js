const { User } = require('../models')
const nodemailer = require('nodemailer')
const jwt = require('jsonwebtoken')
const config = require('../config/config')
const crypto = require("crypto")

let emailFrom = `EShopping <${process.env.EMARKET_EMAIL}>`

function jwtSignUser(user) {
    const ONE_DAY = 60 * 60 * 24 
    return jwt.sign(user, config.authentication.jwtSecret, {
        expiresIn: ONE_DAY
    }) 
}

module.exports = {
    async registerSupplier(req,res){
        req.body.profileImage = "http://localhost:8084/public/user-image/default-man.png"
        req.body.priority =2
        req.body.userType ="Fournisseur"
        req.body.variant = "info "
        req.body.CompanyId=9
        console.log(req.body.CompanyId)
        const user = await User.create(req.body);
        res.send({ id: user.id })
    },
    async register(req, res) {
        
        try {
            req.body.userType = "Client"
            if (req.body.userType == "Client") {
                req.body.variant = "warning"
                req.body.priority = 3
                req.body.CompanyId = 4
            }
            
            else if (req.body.userType == "Admin") {
                req.body.variant = "dark"
                req.body.priority = 1
                req.body.CompanyId = 1
            }
            var buf = crypto.randomInt(100000, 999999);
            var token = buf;
            req.body.registerToken = token;
            req.body.profileImage = "http://localhost:8084/public/user-image/default-man.png"
         console.log(req.body);
         console.log("");
         console.log("heeey");
         
            const user = await User.create(req.body);
            console.log(user.registerToken);
            console.log(user);
       try{
            var transporter = await nodemailer.createTransport({
                service: 'Gmail',
                auth: {
                    user: "eshopcommerce11@gmail.com",
                    pass: "ciniskrrmdageagb" ,
                },
                tls: {
                    rejectUnauthorized: false
                }
            })
       } catch (error) {
        if (error.name === 'SequelizeValidationError') {
          // Handle validation error
          console.log(error.errors); // Access the validation errors
        } else {
          // Handle other errors
          console.log(error);
        }
      }
            var mailOptions = {
                from: emailFrom,
                to: req.body.email,
                subject: "Code de vérification par e-mail pour vous inscrire",
                text: 'Salut ' + user.firstName + ' ' + user.lastName + ',\n\n' +
                    'Bienvenue à EShopping!\n\n' +
                    'Votre code de vérification par e-mail est :' + token + '\n\n' +
                    'Utilisez ce code pour terminer le processus d\'inscription.\n\n' +
                    'Profitez de l\'utilisation de votre compte EShopping !\n'
            }
            await transporter.sendMail(mailOptions, function (err) {
                if (err) {
                    return res.status(403).send({
                        error: "An error occured when trying to send an email to register."
                    });
                }
            });
            return res.send({ id: user.id })
        } catch (err) {
            return res.status(400).send({
                error: 'This account is already in use.'   
            })
        } 
    },   
    async login(req, res) { 
        try {
            const { email, password } = req.body
            const user = await User.findOne({
                where: {
                    email: email
                }
            }) 
            if (!user) {
                return res.status(403).send({
                    error: 'Informations de connexion incorrectes.'
                })
            }
            if (user.registerToken) { 
                var transporter = await nodemailer.createTransport({
                    service: 'gmail',
                    auth: {
                        user: "eshopcommerce11@gmail.com",
                        pass: "ciniskrrmdageagb" ,
                    },
                    tls: {
                        rejectUnauthorized: false
                    }
                })
                var mailOptions = { 
                    from: emailFrom,
                    to: req.body.email,
                    subject: " Code de vérification par e-mail pour vous connecter",
                    text: 'Salut ' + user.firstName + ' ' + user.lastName + ',\n\n' + 'Récemment, vous avez demandé à créer un compte sur EShopping\n\n' +
                        'Veuillez d\'abord vérifier votre adresse e-mail\n\n' +
                        'cliquez sur le lien suivant ou collez-le dans votre navigateur pour terminer ce processus\n\n' +
                        'http://' + 'localhost:8080' + '/user-verify/' + token + '\n\n' +
                        'Si vous ne l\'avez pas demandé, veuillez ignorer cet e-mail.\n'
                }
                await transporter.sendMail(mailOptions, function (err) {
                    if (err) {
                        return res.status(403).send({
                            error: "An error occured when trying to send an email to login verification."
                        });
                    }
                });
                return res.status(403).send({
                    error: 'Nous devons d\'abord vérifier votre adresse e-mail.<br>Nous vous avons donc envoyé un lien de vérification pour le faire.<br>Veuillez suivre les instructions données.'
                })
            }
            const correctPassword = password === user.password
            if (!correctPassword) {
                return res.status(403).send({
                    error: 'Informations de connexion incorrectes.'
                })
            }
            const newUser = {
                id: user.id,
                username: user.username,
                firstName: user.firstName,
                lastName: user.lastName,
                email: user.email,
                userType: user.userType,
                variant: user.variant,
                profileImage: user.profileImage,
                priority: user.priority,
                CompanyId: user.CompanyId
            }
            res.send({
                user: newUser,
                token: jwtSignUser(newUser)
            })
        } catch (err) {
            res.status(500).send({
                error: 'An error occured when trying to sign in.'
            })
        }
    },

    async verifyPassword(req, res) {
        try {
            const correctPassword = req.params.password === req.user.password
            if (!correctPassword) {
                return res.status(403).send({
                    error: 'mot de passe actuel incorrect.'
                })
            }
            res.send({ correctPassword: correctPassword })
        } catch (error) {
            res.status(500).send({
                error: "An error occured when verifying the password"
            })
        }
    },
    async updatePassword(req, res) {
        try {
            const user = await User.update(req.body, {
                where: {
                    id: req.user.id
                }
            })
            res.send(user)
        } catch (err) {
            res.status(500).send({
                error: "An error occured when trying to update the password"
            })
        }
    },
    async requestPasswordToken(req, res) {
        try {
            var buf = crypto.randomBytes(20);
            var token = buf.toString('hex');
            const user = { email: req.body.email, resetPasswordToken: token };
            await User.update(user, {
                where: {
                    email: user.email
                }
            })
            var transporter = await nodemailer.createTransport({
                service: 'gmail',
                auth: {
                    user: "eshopcommerce11@gmail.com",
                    pass: "ciniskrrmdageagb" ,
                },
                tls: {
                    rejectUnauthorized: false
                }
            })
            var mailOptions = {
                from: emailFrom,
                to: req.body.email,
                subject: "Réinitialiser la confirmation du mot de passe",
                text: 'Vous recevez ceci parce que vous (ou quelqu\'un d\'autre) avez demandé la réinitialisation du mot de passe de votre compte.\n\n' +
                    'Veuillez cliquer sur le lien suivant ou le coller dans votre navigateur pour terminer le processus :\n\n' +
                    'http://' + '127.0.0.1:8080' + '/reset-password/' + token + '\n\n' +
                    'Si vous ne l avez pas demandé, veuillez ignorer cet e-mail et votre mot de passe restera inchangé.\n'
            }
            await transporter.sendMail(mailOptions, function (err) {
                if (err) {
                    return res.status(403).send({
                        error: "Une erreur s'est produite lors de la tentative d'envoi d'un e-mail pour demander un jeton de mot de passe"
                    });
                }
            });
            res.send(token);
        } catch (err) {
            res.status(500).send({
                error: 'An error occured when trying to request password token.'
            })
        }
    },
    async verifyPasswordToken(req, res) {
        try {
            console.log(req.params.token)
            const user = await User.findOne({
                where: {
                    resetPasswordToken: req.params.token
                },
                attributes: [
                    "id",
                    "username",
                    "firstName",
                    "lastName",
                    "profileImage",
                    "email",
                    "userType",
                    "variant",
                    
                    "priority",
                    "CompanyId"
                ]
            });
            if (!user) {
                return res.status(403).send({
                    error: "jeton invalide."
                })
            }
          
            res.send(user.dataValues)
        } catch (err) {
            return res.status(500).send({
                error: "An error occured when verifying the password reset token."
            })
        }
    },
    async checkRegsToken(req, res) {
        try {
            const user = await User.findOne({
                where: {
                    email: req.body.email
                },
                attributes: ["id", "firstName", "lastName", "registerToken" ,"email"]
            });
            if (!user) {
                return res.sendStatus(404).status({
                    error: "Adresse e-mail invalide."
                })
            }
            var retUser = {
                id: user.id,
                verificationStatus: true,
                email: user.email
            }
            
            console.log(user.registerToken);
            if (user.registerToken) {
                retUser.verificationStatus = false
                var transporter = await nodemailer.createTransport({
                    service: 'gmail',
                    auth: {
                        user: "eshopcommerce11@gmail.com",
                        pass: "ciniskrrmdageagb" ,                    },
                    tls: {
                        rejectUnauthorized: false
                    }
                })
                var mailOptions = {
                    from: emailFrom,
                    to: req.body.email,
                    subject: "Vérification par e-mail pour vous inscrire",
                    text: 'Salut ' + user.firstName + ' ' + user.lastName + ',\n\n' +
                        'Bienvenue à EShopping!\n\n' +
                        'Votre code de vérification par e-mail est : ' + user.registerToken + '\n\n' +
                        'Utilisez ce code pour terminer le processus d\'inscription \n\n' +
                        'Profitez de l\'utilisation de votre compte EShopping !\n'
                }
                 await transporter.sendMail(mailOptions, function (err) {
                    
                    if (err) {
                        return res.status(403).send({
                            error: "An error occured when trying to send an email to register."
                        });
                    } 
                });
            }
            
            res.send(retUser)
        } catch (err) {
            return res.status(500).send({
                error: "An error occured when trying to check users registration token."
            })
        }
    },
    async verifyRegsToken(req, res) {
        try {
            const user = await User.findByPk(req.body.userId, {
                attributes: [
                    "id",
                    "username",
                    "firstName",
                    "lastName",
                    "profileImage",
                    "email",
                    "userType",
                    "registerToken",
                    "variant",
                    "priority",
                    "CompanyId"
                ]
            }
            );
            console.log(user +"verify reg token");
            if (!user || user.registerToken != req.body.registerToken) {
                return res.status(403).send({
                    error: "jeton invalide ."
                })
            }
            const newUser = {
                id: user.id,
                username: user.username,
                firstName: user.firstName,
                lastName: user.lastName,
                email: user.email,
                userType: user.userType,
                variant: user.variant,
                registerToken: user.registerToken,
                profileImage: user.profileImage,
                priority: user.priority,
                CompanyId: user.CompanyId
            }
            res.send({
                user: newUser,
                token: jwtSignUser(newUser)
            })
        } catch (err) {
            res.status(500).send({
                error: "An error occured when verifying the register token."
            })
        }
    },

    async resetPassword(req, res) {
        try {
            
            const user = { password: req.body.password, resetPasswordToken: "" }
            const userId = req.body.id
            console.log(userId)
            await User.update(user, {
                where: {
                    id: userId
                }
            })
            var transporter = await nodemailer.createTransport({
                service: 'gmail',
                auth: {
                    user: "eshopcommerce11@gmail.com",
                    pass: "ciniskrrmdageagb" ,
                },
                tls: {
                    rejectUnauthorized: false
                }
            })
            var mailOptions = {
                from: emailFrom,
                to: req.body.email,
                subject: "Accusé de réception de la mise à jour du mot de passe",
                text: 'Bienvenue ' + req.body.name + '\n\n' +
                    'Nous voulions vous informer que votre mot de passe EShopping a été réinitialisé. \n'
            }
            await transporter.sendMail(mailOptions, function (err) {
                if (err) {
                    return res.status(403).send({
                        error: "An error occured when trying to send email to reset password."
                    })
                }
            });
            res.send(userId)
        } catch (err) {
            
            res.status(500).send({
                error: "An error occured when trying to reset password."
            })
        }
    },
    async resetRegsToken(req, res) {
        try {
            const user = { registerToken: "" }
            const userId = req.body.id
            const userRet = await User.update(user, {
                where: {
                    id: userId
                }
            })
            var transporter = await nodemailer.createTransport({
                service: 'gmail',
                auth: {
                    user: "eshopcommerce11@gmail.com",
                    pass: "ciniskrrmdageagb" ,                },
                tls: {
                    rejectUnauthorized: false
                }
            })
            var mailOptions = {
                from: emailFrom,
                to: req.body.email,
                subject: "Vérification de l'adresse e-mail confirmée",
                text: "Bienvenue " + req.body.name + ",\n\n"
                    + " email est maintenant vérifié sur EShopping.\n\n"
                    + "Merci.\n"
            }
            await transporter.sendMail(mailOptions, function (err) {
                if (err) {
                    return res.status(403).send({
                        error: "An error occured when trying to send an email to reset register token"
                    });
                }
            });
            res.send(userRet)
        } catch (err) {
            res.status(500).send({
                error: "An error occured when trying to reset register token."
            })
        }
    }
}