const state = {
    userInfo: '',
    sysmeu: '',
    curMenu: '',
    errCode:{
        SAVE_ERR: '保存失败',
    },
    apiServer: '',
}

const getters = {
    userinfo: (state)=>{return state.userInfo},
    sysmenu: (state)=>{return state.sysmeu},
    curmenu: (state)=>{return state.curMenu},
    SysErrCode: (state) => {return state.errCode},
    apiServer: (state) => {return state.apiServer},
}

const actions = {
    setUserInfo(context,data){context.commit('setUserInfo',data);},
    setMenu(context,data){context.commit('setMenu',data);},
    setCurMenu(context,data){context.commit('setCurMenu',data);},
}

const mutations = {
    setUserInfo(state,data){state.userInfo = data;},
    setMenu(state,data){state.sysmeu = data;},
    setCurMenu(state,data){state.curMenu = data;},
}

export default {
    state,
    getters,
    actions,
    mutations
}