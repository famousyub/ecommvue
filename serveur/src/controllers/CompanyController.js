const { Company , Contract} = require('../models')

module.exports = {
	async getCompany(req, res) {
		try {
			const company = await Company.findByPk(req.params.companyId);

			res.send(company)
		} catch (err) {
			res.status(500).send({
				error: 'An error occured when trying to fetch company.'
			})
		}
	} ,
	async getAllCompany(req,res){
		try {
			const Companies = await Company.findAll({
				attributes: [
					"id",
					"name",
					"location",
				  ],
				}

			);
			res.send(Companies)
		} catch (err) {
			res.status(500).send({
			  error: "An error occured when trying to fetch companies.",
			});
		  }
	},
	async createCompany(req,res){
		try {
			console.log(req.body);
			const company = await Company.create(req.body);
			console.log(company);
			res.send(company);
		}catch(err) {
			res.status(500).send({
				error : 'An error occured when trying to create company.'
			})
		}
	},
	async createContract(req,res){
		try {
			console.log(req.body)
			const contract = await Contract.create(req.body);
			res.send(contract);
		}catch(err) {
			
		res.status(500).send({
			error : 'An error occured when trying to create contract.'
		})
	}
	},
	async getCompanyByName(req,res){
		try{
			const company = await Company.findOne({
                where: {
                    name: req.params.companyName
                },
                attributes: ['id'],
            })
			if (!company) {
                return res.status(403).send({
                    error: "Aucune Entreprise trouvé."
                })
            }
            res.send(company)
        } catch (error) {
            res.status(500).send({
                error: "An error occured when trying to get a company."
            })
	}
}
}
