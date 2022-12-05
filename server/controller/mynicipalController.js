const connection = require('../database/db')

class isMynicipal {
    async isSelect(req, res) {
        try {
            const connect = await connection
            const [rows, fields] = await connect.execute('SELECT `mynicipal`  FROM `mynicipal` WHERE 1')
            return res.status(200).json({ message: rows })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }

    async addMynicipal(req, res) {
	try {
	    const connect = await connection
	    const { mynicipal } = req.body
	    const [rows, fields] = await connect.execute('INSERT INTO `mynicipal`(`mynicipal`) VALUES (?)', [mynicipal])
	    return res.status(200).json({ message: "Добавленно" })
	} catch (error) {
	    return res.status(400).json({ message: error.message})
	}
    }
}

module.exports = new isMynicipal()
