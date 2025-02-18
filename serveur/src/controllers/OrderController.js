const { Order } = require('../models')
const nodemailer = require('nodemailer')

let emailFrom = `EShopping <${process.env.EMARKET_EMAIL}>`

module.exports = {
	async getOrderList(req, res) {
		try {
			const orderList = await Order.findAll({
				order: [['createdAt', 'DESC']],
				attributes: ["id",
							"status",
							"address",
							"name",
							"productCost",
							"currency",
							"phoneNo",
							"shippingCost",
							"createdAt",
							"email"]
			});
			res.send(orderList)
		} catch (err) {
			res.status(500).send({
				error: 'An error occured when trying to fetch order list.'
			})
		}
	},
	async getOrder(req, res) {
		try {
			const order = await Order.findByPk(req.params.orderId,{
				attributes: ["id",
							"status",
							"address",
							"name",
							"productCost",
							"currency",
							"phoneNo",
							"shippingCost",
							"createdAt",
							"email"]
			})
			res.send(order)
		} catch (err) {
			res.status(500).send({
				error: 'An error occured when trying to fetch an order.'
			})
		}
	},
	async getOrderBySessionId(req, res) {
		try {
			const order = await Order.findOne({
				where: {
					checkoutSessionId: req.params.sessionId,
					attributes: ["id",
							"status",
							"address",
							"name",
							"productCost",
							"currency",
							"phoneNo",
							"shippingCost",
							"createdAt",
							"email"]
				}
			})
			res.send(order)
		} catch (err) {
			res.status(500).send({
				error: 'An error occured when trying to fetch an order.'
			})
		}
	},
	async createOrder(req, res) {
		try {
			const order = await Order.create(req.body)
			var transporter = await nodemailer.createTransport({
				service: 'gmail',
				auth: {
					user: "eshopcommerce11@gmail.com",
					pass: "ciniskrrmdageagb" ,				},
				tls: {
					rejectUnauthorized: false
				}
			})
			var mailOptions = {
				from: emailFrom,
				to: order.email,
				subject: "Vérifier l\'état des commandes",
				text: 'Salut ' + order.name + ',\n\n' +
					'Merci pour votre achat\n\n' +
					'Veuillez suivre le lien pour suivre votre commande.\n\n' +
					'http://' + '127.0.0.1:8080' + '/order/' + order.checkoutSessionId + '\n\n' +
					'Votre identifiant de session : ' + order.checkoutSessionId + '\n\n' +
					'Merci pour votre fidélité EShopping\n'
			}
			await transporter.sendMail(mailOptions, function (err) {
				if (err) {
					return res.status(403).send({
						error: "An error occured when trying to send an email to register."
					});
				}
			});
			res.send(order)
		} catch (err) {
			res.status(500).send({
				error: 'An error occured when trying to create an order.'
			})
		}
	},
	async updateOrder(req, res) {
		try {
			await Order.update(req.body, {
				where: {
					id: req.body.id
				}
			})
			res.send(req.body)
		} catch (err) {
			res.status(500).send({
				error: 'An error occured when trying to update an order.'
			})
		}
	},
	async deleteOrder(req, res) {
		try {
			const order = await Order.findByPk(req.params.orderId)
			if (!order) {
				return res.status(403).send({
					error: 'No order to delete.'
				})
			}
			await order.destroy()
			res.send(order)
		} catch (err) {
			res.status(500).send({
				error: 'An error occured when trying to delete an order.'
			})
		}
	},
}
