module.exports = (sequelize, DataTypes) => {
    const HistoProduct = sequelize.define('HistoProduct', {
      id: {
        type:           DataTypes.INTEGER,
        allowNull:      false,
        primaryKey:     true,
        autoIncrement:  true
      },
     
      amount:           DataTypes.FLOAT,
      
      
    })
    HistoProduct.associate = function (models) {
      HistoProduct.belongsTo(models.Product)
      HistoProduct.belongsTo(models.Company)
    }
    return HistoProduct
  }