<template>
    <div>
        <div v-if="isList == 'test'">
            <div class="test__sep">
                <h1 class="test__name">Тест</h1>
                <div v-for="itemQuest in isTestQuest.length" :key="itemQuest">
                    <h3 class="quest__test">Вопрос {{ itemQuest }}:  <span>{{ isTestQuest[itemQuest - 1] }}</span></h3>
                    
                    <div class="test__quest" style="display: flex;" v-for="itemAnswer in isAnswer[itemQuest - 1]" :key="itemAnswer">
                        <input type="radio" v-model="isVerifySelectAnswer[itemQuest - 1]" :value="itemAnswer"> <span>{{itemAnswer}}</span>

                        <!-- <select v-model="isVerifySelectAnswer[itemQuest - 1]">
            
                            <option :value="itemAnswer" v-for="itemAnswer in isAnswer[itemQuest - 1]" :key="itemAnswer">
                                {{ itemAnswer }}
                            </option>
                        </select> -->
                    </div>
                </div>
                <button @click="isFinishTest" class="test__finish">Завершить тест</button>
            </div>
        </div>

            <div v-if="isList == 'SuccessTest' || isList == 'FalseTest'">
            <h2>Спасибо, что прошли тестирование</h2>
                <div class="verify">
                  <img src="../../public/cerf.jpg" width="350" height="400" alt="">
                  <a href="/img/cerf.e308b144.jpg" download="/img/cerf.e308b144.jpg">
                  <button>Скачать</button>
                 </a>
       	        </div>

		            <table>
                        <thead>
                            <tr>
                                <th>Число вопросов</th>
                                <th v-for="index3 in isNextR.length" :key="index3">{{ index3 }}</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Ответы</td>
                                <td v-for="index1 in isNextR.length" :key="index1" :class="isNextR[index1 - 1] === 1 ? 'primary' : 'accent' && isNextR[index1 - 1] === 0 ? 'primaryRed' : 'accent2'">{{isNextR[index1 - 1]}}</td>
                            </tr>
                        </tbody>
                    </table>
       	        <form>
           	 <input type="text" v-model='fio' placeholder="ФИО">
           	 <input type="text" v-model='mail' placeholder="E-mail">
        	    <button @click='send()'>Отправить</button>
	        </form>
	    </div>
    </div>
</template>

<script>
import axios from 'axios'
import settings from '../settings'

export default {
    data() {
        return {
            isMaterialsFalse: "",
            isTestFalse: "",
            isFullMaterials: [],
            isTestQuest: [],
            isAnswer: [],
            isMaterialActive: 0,
            isTestActive: 0,
            isSuccess: false,
            isList: "test",
            isVerifyAnswer: [],
            isVerifySelectAnswer: [],
	        isNextR: [],
            //Materials
            isTraining: false,
            isMethodical: false,
            isInst: false
        }
    },

    mounted: async function() {
        this.isReadyTest()
        this.isReadyAnswer()
    },

    methods: {
        async isReadyTest() {
            await axios.post(`${settings.host}/user/testQuest`, {
                test_id: this.$route.params.id
            }).then(response => {
                this.isTestQuest = JSON.parse(response.data.message.quest)
            }).catch(error => {
                this.isTestFalse = "Теста нет!"
            })
        },

        async isReadyAnswer() {
            await axios.post(`${settings.host}/user/testAnswer`, {
                test_id: this.$route.params.id
            }).then(response => {
		
            let resultVerifyAnswer = JSON.parse(response.data.message[0].verify_answer) 	 
		    let result = JSON.parse(response.data.message[0].answer)
        	        
            this.isAnswer = result
            this.isVerifyAnswer = resultVerifyAnswer
            }).catch(error => {
                this.isTestFalse = "Вопросов нет!"
            })
        },
        isFinishTest() {
            let next = 0
            let nextR = []
            console.log(nextR)
            for (let indexAnswer = 0; indexAnswer < this.isVerifyAnswer.length; indexAnswer++) {
                if(this.isVerifySelectAnswer[indexAnswer] == this.isVerifyAnswer[indexAnswer]) {
                    next += 1
		    nextR.push(1)
                } else {
		    nextR.push(0)
                }
            }

            let percent = this.isVerifyAnswer.length * 0.5
            if (percent <= next) {
                this.isList = "SuccessTest"
		        this.isNextR = nextR

		        axios.post(`${settings.host}/user/loading`, {
                    name: localStorage.getItem("name"),
                    result: nextR
                }).then(response => {
                    console.log("Success")
                })
            } else {
                this.isList = "FalseTest"
                this.isNextR = nextR
                axios.post(`${settings.host}/user/loading`, {
                    name: localStorage.getItem("name"),
                    result: nextR 
                }).then(response => {
                    console.log("False")
                })

	        }
        }
    },
}
</script>

<style scoped>
table {
    margin: 15px 0px;
}

th, td {
    border: 1px solid #000;
}

td {
    padding: 0px 5px;
}

.primary {
    background: lightgreen;
}

.primaryRed {
    background: lightcoral;
}
.h22 {
    text-align: center;
    color: red;
}

.button2 {
    width: 165px;
    height: 59px;
    font-weight: 500;
    background: rgb(28, 176, 246);
    border-radius: 7px;
    border: none;
    color: rgb(255, 255, 255);
    box-shadow: rgb(34 155 213) 0px 4px 0px;
    padding: 6px 20px;
    font-size: 20px;
    transition: all 0.3s ease-in-out 0s;
    cursor: pointer;
    box-sizing: border-box;
    text-decoration: none;
}


h2 {
    text-align: center;
    color: #000;
}

.verify {
    display: grid;
    justify-content: center;
    margin: 25px 0px;
}

.verify > a > button {
    width: 80px;
    height: 30px;
    margin: 10px 0px;
}

.verify > a {
    text-decoration: none;
    color: #000;
}

form {
    display: flex;
    flex-direction: column;
    max-width: 350px;
    margin: 0 auto;
}

form > input {
    margin: 5px 0px;
    height: 30px;
    font-size: 20px;
    padding-left: 5px;
}

form > button {
    margin: 5px 0px;
    height: 30px;
    font-size: 20px;
}
a h2 {
	display: flex;
	align-items: center;
}
a {
	text-decoration: none;
}

.test__ready {
    border: 1px solid #000;
    width: 900px;
    height: 50px;
    display: flex;
    align-items: center;
    padding-left: 10px;
    cursor: pointer;
    margin: 13px 0px;
    color: #000;
    font-size: 24px;
    font-weight: bold;
}

.test__finish {
    margin: 70px 0px;
    border: 1px solid #000;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 175px;
    height: 45px;
    text-decoration: none;
    color: #000;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
}

.test__sep {
    max-width: 900px;
    margin: 0 auto;
}

.test__name {
    margin: 40px 0px;
    text-align: center;
}

.quest__test > span {
    font-weight: 300;
}

.test__quest {
    position: relative;
    display: inline-block;
    margin: 22px 25px;
    display: flex;
    align-items: center;
}

.test__quest > input {
    margin-right: 10px;
}

input[type='radio']:after {
    width: 15px;
    height: 15px;
    border-radius: 15px;
    top: -2px;
    left: -1px;
    position: relative;
    background-color: #d1d3d1;
    content: '';
    display: inline-block;
    visibility: visible;
    border: 2px solid white;
}

input[type='radio']:checked:after {
    width: 15px;
    height: 15px;
    border-radius: 15px;
    top: -2px;
    left: -1px;
    position: relative;
    background-color: lightgreen;
    content: '';
    display: inline-block;
    visibility: visible;
    border: 2px solid white;
}

</style>