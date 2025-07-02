async function GetData(link, params = "") {
    link = params == "" ? link : link + "?" + params

    const response = await fetch(link, {
        method: "GET", // *GET, POST, PUT, DELETE, etc.
        mode: 'cors', // no-cors, *cors, same-origin
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin', // include, *same-origin, omit
        headers: {
            "Content-type": "application/json"
        },
    })

    if(response.status != 200) {
        result = {
            type: "http_error",
            code: response.status,
            message: response.statusText
        }

        return result
    }
    else {
        return response.json()
    }
}

async function PostData(link, data = {}) {
    const response = await fetch(link, {
        method: "post", // *GET, POST, PUT, DELETE, etc.
        mode: 'cors', // no-cors, *cors, same-origin
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin', // include, *same-origin, omit
        headers: {
            "Content-type": "application/json"
        },
        body: JSON.stringify(data)
    })

    if(response.status != 200) {
        result = {
            type: "http_error",
            code: response.status,
            message: response.statusText
        }

        return result
    }
    else {
        return response.json()
    }
}

async function PutData(link, data = {}) {
    const response = await fetch(link, {
        method: "put", // *GET, POST, PUT, DELETE, etc.
        mode: 'cors', // no-cors, *cors, same-origin
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin', // include, *same-origin, omit
        headers: {
            "Content-type": "application/json"
        },
        body: JSON.stringify(data)
    })

    if(response.status != 200) {
        result = {
            type: "http_error",
            code: response.status,
            message: response.statusText
        }

        return result
    }
    else {
        return response.json()
    }
}

async function DeleteData(link, data = {}) {
    const response = await fetch(link, {
        method: "delete", // *GET, POST, PUT, DELETE, etc.
        mode: 'cors', // no-cors, *cors, same-origin
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin', // include, *same-origin, omit
        headers: {
            "Content-type": "application/json"
        },
        body: JSON.stringify(data)
    })

    if(response.status != 200) {
        result = {
            type: "http_error",
            code: response.status,
            message: response.statusText
        }

        return result
    }
    else {
        return response.json()
    }
}

    var FETCH_DATA = {
        mode: 'cors', // no-cors, *cors, same-origin
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin', // include, *same-origin, omit
    }
    var DEFAULT_HEADERS = {
        "Content-Type": "application/json",
        "Authorization": "Bearer 69"
    }

    async function fetchApi(link, params = null, method = "get", headers = DEFAULT_HEADERS) {
        processHeaders(headers)
        FETCH_DATA.method = method
        FETCH_DATA.body = null

        if(typeof(params) == "string") {
            link = params == "" ? link : link + "?" + params
        }

        if(method != "get") {
            FETCH_DATA.body = JSON.stringify(params)
        }

        const response = await fetch(link, FETCH_DATA)

        if(response.status != 200) {
            result = {
                type: "http_error",
                code: response.status,
                message: response.statusText
            }

            return result
        }
        else {
            return response.json()
        }
    }

    function processHeaders(headers = {}) {
        if(Object.keys(headers).length > 0) {
            if(headers.Authorization == null) {
                headers.Authorization = "Bearer 69"
            }
        }
        FETCH_DATA.headers = headers
    }