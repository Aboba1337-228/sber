const connection = require('../database/db')

class ResultsTable {
    async isUpLoading(req, res) {
        try {
            const { name, result } = req.body
	    const sl = `[${result}]`
            const connect = await connection
            await connect.execute('INSERT INTO `test_result` (`name`, `result`) VALUES (?, ?)', [name, sl])
            return res.status(200).json({ message: "Добавленно" })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }

    async isUnLoading(req, res) {
        try {
           const connect = await connection
           const [rows, fields] = await connect.execute('SELECT * FROM `test_result` WHERE 1')
           return res.status(200).json({ message: rows })
         } catch (error) {
            return res.status(400).json({ message: error.message })
       }
    }
}

module.exports = new ResultsTable()
