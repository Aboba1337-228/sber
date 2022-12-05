<template>
    <div class="admin">
        <h1>Администрирование</h1>
        <div class="container">
            <div class="admin__inner">
                <div class="admin__sidebar">
                    <h2>Редактирование</h2>
                    <router-link class="admin__nav" to="0">Новости</router-link>
                    <router-link class="admin__nav" to="1">Тесты</router-link>
                    <router-link class="admin__nav" to="2">Регионы / Районы</router-link>
                    <router-link class="admin__nav" to="3">Результаты</router-link>
                </div>
                <div class="admin__main">
                    <div class="main__news" v-if="$route.params.id == 0">
                        <h2>Новости</h2>
                        <hr>
                        <div class="news__btn">
                            <button @click="isNews = 0">Форма</button>
                            <button @click="isNews = 1">Таблица</button>
                        </div>
                        <hr>
                        <div class="main__news" v-if="isNews == 0">
                            <input type="file">
                            <input type="text" class="news__name" placeholder="Название новости">
                            <textarea placeholder="Описание новости" cols="90" rows="15"></textarea>
                            <button>Загрузить</button>
                        </div>

                        <table v-if="isNews == 1">
                            <thead>
                                <tr>
                                    <th>Номер</th>
                                    <th>Картинка</th>
                                    <th>Название</th>
                                    <th>Текст</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>logo.png</td>
                                    <td>Название</td>
                                    <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                                        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                         Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
                                         nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
                                         reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
                                         pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa 
                                         qui officia deserunt mollit anim id est laborum.</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>logo.png</td>
                                    <td>Название</td>
                                    <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                                        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                         Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
                                         nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
                                         reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
                                         pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa 
                                         qui officia deserunt mollit anim id est laborum.</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>logo.png</td>
                                    <td>Название</td>
                                    <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                                        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                         Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
                                         nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
                                         reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
                                         pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa 
                                         qui officia deserunt mollit anim id est laborum.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div v-if="$route.params.id == 1">1</div>
                    <div class="main__region" v-if="$route.params.id == 2">
                        <h2>Регион</h2>
                        <hr>
                        <div class="region__btn">
                            <button @click="isRegion = 0">Форма</button>
                            <button @click="isRegion = 1">Таблица</button>
                        </div>
                        <hr>
                        <form @submit.prevent="addMynicipal()" class="main__region" v-if="isRegion == 0">
			                {{ resultMynicipal }}
                            <input type="text" class="regoin__name" v-model="addmynic" placeholder="Название муниципалитет">
                            <button>Загрузить</button>
                        </form>

                        <table v-if="isRegion == 1">
                            <thead>
                                <tr>
                                    <th>Номер</th>
                                    <th>Муниципалитет</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="index123 in isMynicipal.length" :key="index123">
                                    <td>{{ index123 }}</td>
                                    <td>{{ isMynicipal[index123 - 1] }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="main__result" v-if="$route.params.id == 3">
                        <h2>Результаты теста</h2>
                        <hr>
                        <Bar
                            :chart-options="chartOptions"
                            :chart-data="chartData"
                            :chart-id="chartId"
                            :dataset-id-key="datasetIdKey"
                            :plugins="plugins"
                            :css-classes="cssClasses"
                            :styles="styles"
                            :width="width"
                            :height="height"
                        />
                        <hr>
                        <table>
                            <thead>
                                <tr>
                                    <th>Номер</th>
                                    <th>ФИО участника</th>
                                    <th v-for="index in 13" :key="index">{{ index }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="index1 in isResult.length" :key="index1">
                                    <td>{{ isResult[index1 - 1][0] }}</td>
                                    <td>{{ isResult[index1 - 1][1] }}</td>
                                    <td v-for="index2 in isResult[index1 - 1][2].length" :key="index2" :class="isResult[index1 - 1][2][index2 - 1] === 1 ? 'primary' : 'accent' && isResult[index1 - 1][2][index2 - 1] === 0 ? 'primaryRed' : 'accent2'">{{ isResult[index1 - 1][2][index2 - 1] }}</td>
                               </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>


<script>
import axios from 'axios'
import settings from '../../settings'
import { Bar } from 'vue-chartjs'
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

export default {
    components: { Bar },
    props: {
        chartId: {
        type: String,
        default: 'bar-chart'
        },
        datasetIdKey: {
        type: String,
        default: 'label'
        },
        width: {
        type: Number,
        default: 200
        },
        height: {
        type: Number,
        default: 200
        },
        cssClasses: {
        default: '',
        type: String
        },
        styles: {
        type: Object,
        default: () => {}
        },
        plugins: {
        type: Object,
        default: () => {}
        }
    },
    data() {
        return {
            chartData: {
                labels: [ 1,2,3,4,5,6,7,8,9,10,11,12,13 ],
                datasets: [ { data: [3,1,3,6,4,6,3,8,4,3,3,7,3] } ]
            },

            chartOptions: {
                responsive: true
            },

            isListAdmin: 0,
            isRegion: 0,
            isNews: 0,
            isResult: [],
            isMynicipal: [],
            addmynic: "",
            resultMynicipal: "",
            isNewsAll: []
        }
    },
    mounted: async function() {
            try {
		const resultTest = await axios.post(`${settings.host}/user/unloading/`)
		const resultMynicipal = await axios.post(`${settings.host}/user/mynicipal/`)
		const resultNews = await axios.post(`${settings.host}/user/news/`)
		console.log(resultNews)
		
		for (let index3 = 0; index3 < resultNews.data.message.length; index3++){
                        this.isNewsAll.push(resultNews.data.message[index3].mynicipal)
                }

		for (let index2 = 0; index2 < resultMynicipal.data.message.length; index2++){
			this.isMynicipal.push(resultMynicipal.data.message[index2].mynicipal)
		}

                for (let index = 0; index < resultTest.data.message.length; index++) {
                    this.isResult.push([resultTest.data.message[index].id, resultTest.data.message[index].name, JSON.parse(resultTest.data.message[index].result)])
                } 
            } catch(error) {
                console.log(1)
            }
        },
    methods: {
	async addMynicipal() {
		await axios.post(`${settings.host}/user/addmynicipal/`, {
		      mynicipal: this.addmynic
		}).then(response => {
			this.resultMynicipal = "Добавленно"
		})
	}
    }

}
</script>

<style scoped>

.admin__nav {
    border: 1px solid #000;
    margin: 5px 0px;
    text-decoration: none;
    padding: 6px 3px;
    color: #000;
    font-weight: bold;
}

h1 {
    text-align: center;
    margin: 20px 0px;
}

th, td {
    border: 1px solid #000;
    text-align: center;
}

.primary {
    background: lightgreen;
}

.primaryRed {
    background: lightcoral;
}


.admin__inner {
    display: flex;
}

.admin__sidebar {
    border: 1px solid #000;
    flex-direction: column;
    display: flex;
    width: 200px;
    height: 484px;
    padding: 10px;
}

.admin__sidebar > h2 {
    text-align: center;
    margin-bottom: 10px;
}

.admin__sidebar > button {
    padding: 5px 0px;
    margin: 5px 0px;
    cursor: pointer;
}

.admin__main {
    margin: 0px 0px 0px 50px;
}

/* news */
.main__news {
    display: flex;
    flex-direction: column;
    width: 1000px;
}

.main__news > hr {
    margin: 20px 0px;
}

.news__btn > button {
    padding: 5px 20px;
    margin-right: 10px;
    cursor: pointer;
}

.main__news > input, textarea {
    margin: 10px 0px;
    font-size: 20px;
}

.main__news > button {
    padding: 15px 0px;
    width: 200px;
    cursor: pointer;
}

.news__name, textarea {
    padding: 5px 0px;
    padding-left: 5px;
}
/* end news */

/* regoin */
.main__region {
    display: flex;
    flex-direction: column;
    width: 700px;
}

.main__region > hr {
    margin: 20px 0px;
}

.region__btn > button {
    padding: 5px 20px;
    margin-right: 10px;
    cursor: pointer;
}

.main__region > input, textarea {
    margin: 10px 0px;
    font-size: 20px;
}

.main__region > button {
    padding: 10px 0px;
    width: 200px;
    cursor: pointer;
}

.regoin__name, textarea {
    padding: 5px 0px;
    padding-left: 5px;
}
/* end region */

/* result */
.main__result {
    display: flex;
    flex-direction: column;
    width: 700px;
}

.main__result > hr {
    margin: 20px 0px;
}
/* end result */
</style>
