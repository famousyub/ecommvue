const passport = require('passport')

module.exports = function(req, res, next) {
    passport.authenticate('jwt', function(err, user){
        if(err) {
            res.status(403).send({
                error: 'vous n\'avez pas accès à cette ressource'
            })
        } else if(!user){
            res.status(403).send({
                error: 'vous n\'avez pas accès à cette ressource'
            })
        } else {
            req.user = user
            next()
        }
    })(req, res, next)
}