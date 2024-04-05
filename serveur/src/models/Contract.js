module.exports = (sequelize, DataTypes) => {
    const Contract = sequelize.define('Contract', {
      id: {
        type:           DataTypes.INTEGER,
        allowNull:      false,
        primaryKey:     true,
        autoIncrement:  true
      },
      commission:             DataTypes.FLOAT,

      startDate:             DataTypes.DATE,
      endDate:         DataTypes.DATE,
      
    })
    Contract.associate = function (models) {
        Contract.belongsTo(models.Company)
        Contract.belongsTo(models.Product)
    }
    return Contract
  }