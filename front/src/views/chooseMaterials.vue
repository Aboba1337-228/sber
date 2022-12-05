<template>
  <h1 v-if="_success == false" style="text-align: center; color: red; margin: 15px 0px 50px 0px;">Сначала авторизируйтесь</h1>
  <div v-if="Access()" class="test view">
    <div v-if="_success == true" class="container">
      <infoFullMaterials />
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import settings from '../settings'
import infoFullMaterials from '../components/infoMaterialsRequest.vue'

export default {
  components: {
    infoFullMaterials
  },
  data() {
    return {
      _success: false,
    }
  },
  methods: {
    async Access() {
            let token = localStorage.getItem('token')
            if(token == null) {} else {
                try {
                    axios({
                        method: 'post',
                        url: `${settings.host}/user/loginByToken`,
                        headers: {'Authorization': token}
                    })
                    this._success = true
                } catch (error) {
                  if(error.response.data.message == "jwt expired") {
                      localStorage.removeItem('token')
                  }
                    this._success = false
                }
            }
        },
    }
}
</script>


