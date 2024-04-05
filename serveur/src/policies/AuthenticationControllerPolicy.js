const Joi = require('joi')

module.exports = {
    register(req, res, next) {
        const schema = Joi.object({
            firstName: Joi.string().regex(new RegExp('^.{2,32}$')),
            lastName: Joi.string().regex(new RegExp('^.{2,32}$')),
            email: Joi.string().email(),
            password: Joi.string().regex( new RegExp('^[a-zA-z0-9]{8,32}$')),
            phoneNo: Joi.string().regex(new RegExp('^[0-9]{2,32}$')),
            
        })

        const validate = schema.validate(req.body)
        if (validate.error) {
            console.log(validate.error)
            switch (validate.error.details[0].context.key) {
                case 'firstName':
                    res.status(400).send({
                        error: `le prénom peut avoir 2 à 32 caractères`
                    })
                    break
                case 'lastName':
                    res.status(400).send({
                        error: `le nom de famille peut avoir de 2 à 32 caractères`
                    })
                    break
                case 'email':
                    res.status(400).send({
                        error: 'Veuillez fournir une adresse email valide'
                    })
                    break
                case 'password':
                    res.status(400).send({
                        error: `Format de mot de passe invalide<br>
                        Seuls les minuscules, les majuscules et les chiffres sont autorisés.
                        `
                    })
                    break
                case 'phoneNo':
                    res.status(400).send({
                        error: `Format de numéro de téléphone invalide<br>
                        
                        Seuls les chiffres sont autorisés et .
                    `
                    })
                default:
                    res.status(400).send({
                        error: 'Invalid error in authentication controller.'
                    })
            }
        } else {
            next()
        }
    },
    updatePassword(req, res, next) {
        const schema = Joi.object({
            password: Joi.string().regex(
                new RegExp('^[a-zA-z0-9]{8,32}$')
            ),
        })
        const validate = schema.validate(req.body)
        if (validate.error) {
            switch (validate.error.details[0].context.key) {
                case "password":
                    res.status(400).send({
                        error: 'Format de mot de passe invalide. Seuls les minuscules, les majuscules et les chiffres sont autorisés.'
                    })
                    break;
                default:
                    res.status(400).send({
                        error: 'Invalid error in authentication controller.'
                    })
            }
        } else {
            next()
        }
    }
}