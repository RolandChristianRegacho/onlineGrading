//Sample data of possible object template to be passed to paginate a table
/* 
const details = {
    //This sets the url on where the request will be coming from
    url: "./api/controllers/changelogs.php",
    //This sets wether a button will be generated at the end
    method: {
        edit: "editAccount(this);",
        delete: "deleteAccount(this);"
    },
    //This sets what table to use
    table_id: "tblChangelogs",
    //This sets the current page to render
    current_page: 1,
    //This sets table addiitonal styles
    table_style: [
        {
            type: "th",
            propertyName: "background",
            value: "red"
        }
    ],
    //This sets certain td styles
    style: [
        {
            parameter: 'version',
            value: "text-align: center;"
        }
    ],
    //this sets certain th styles
    header: {
        element: [
            {
                id: "hdr_version",
                properties: [
                    {
                        propertyName: "min-width",
                        value: "150px"
                    },
                    {
                        propertyName: "text-align",
                        value: "center"
                    },
                ]
            },
            {
                id: "hdr_date",
                properties: [
                    {
                        propertyName: "min-width",
                        value: "150px"
                    }
                ]
            }
        ]
    }
}
*/


const MAX_PAGE_COUNT = 10

async function paginateTable(data = {}) {
    var row = "";
    let additional_params = "page=" + data.current_page

    if(data.hasOwnProperty("additional_information")) {
        additional_params += "&" + data.additional_information
    }

    if(data.hasOwnProperty("table_style")) {
        setTableDesign(data.table_style)
    }

    if(data.hasOwnProperty("header")) {
        for(let items in data.header.element) {
            setHeaderDesign(data.header.element[items].id, data.header.element[items].properties)
        }
    }

    fetchApi(data.url, additional_params)
    .then(response => {
        if(response.type == "success") {
            let id = "";
            for(let items in response.content) {
                row += `<tr>`

                Object.keys(response.content[items]).forEach(function(key) {
                    var value = response.content[items][key];

                    if(key == "id") {
                        id = value
                    }
                    else {
                        if(data.hasOwnProperty("style")) {
                            for(let index in data.style) {
                                if(data.style[index].parameter == key) {
                                    row += `
                                    <td style="${data.style[index].value}">
                                        ${value == null ? "N/A" : value}
                                    </td>`
                                }
                                else {
                                    row += `
                                    <td>
                                        ${value == null ? "N/A" : value}
                                    </td>`
                                }
                            }
                        }
                        else {
                            row += `
                            <td>
                                ${value == null ? "N/A" : value}
                            </td>`
                        }
                    }
                });

                if(data.method) {
                    row += `<td>`

                    if(data.method.hasOwnProperty("edit")) {
                        row += `
                            <button id = "${id}" class = "table_button green-b white-f" onclick = "${data.method.edit}")">
                                Edit
                            </button>
                        `
                    }

                    if(data.method.hasOwnProperty("delete")) {
                        row += `
                            <button id = "${id}" class = "table_button red-b white-f" onclick = "${data.method.delete}">
                                Delete
                            </button>
                        `
                    }

                    row += `</td>`
                }
                else {
                    row += `</tr>`
                }
            }

            $("#" + data.table_id + " tbody").html(row)
            renderPageButtons(response.length, data.table_id, data.current_page, data)
        }
        else if(response.type == "empty") {
            row += `
            <tr>
                <td colspan = ${response.length} style = "text-align: center;">
                    ${response.message}
                </td>
            </tr>`

            $("#" + data.table_id + " tbody").html(row)
        }
        else {
            window.location.href = `./?error_pages&code=${response.code}&message=${response.message}`;
        }
    })
}

function setTableDesign(data = {}) {
    for(let items in data) {
        $(`${data[items].type}`).css(data[items].propertyName, data[items].value)
    }
}

function setHeaderDesign(id, data = {}) {
    for(let items in data) {
        $(`#${id}`).css(data[items].propertyName, data[items].value)
    }
}

function nextPage(page, data) {
    let details = data
    details.current_page = page

    paginateTable(details)
}

function renderPageButtons(length, page_id, current_page, data_object = {}) {
    if(length > MAX_PAGE_COUNT) {
        length = length / MAX_PAGE_COUNT
        length = Math.ceil(length)
    }
    else {
        length = 1
    }
    
    let data = JSON.stringify(data_object)
    currentPage = parseInt(current_page)
    const range = 4
    let page = ""
    //checks if previous and last will display
    if(current_page > 1) {
        page += `<button onClick = 'nextPage(1, ${data});'><i class="fas fa-angle-double-left"></i></button>`

        let previous = current_page - 1

        page += `<button onClick = 'nextPage(${previous}, ${data});'><i class="fas fa-angle-left"></i></button>`
    }
    //checks current pages to show 1, 2, 3...
    for(let j = (current_page - range); j < (current_page + range); j++) {
        if((j > 0) && (j <= length)) {
            if(j == current_page) {
                page += `<button class = "page-active" onClick = 'nextPage(${j}, ${data});' disabled>` + j + `</button>`
            }
            else {
                page += `<button onClick = 'nextPage(${j}, ${data});'>` + j + `</button>`
            }
        }
    }
    //checks if total pages are greater than 1
    if(length > 1) {
        if(current_page != length) {
            let next = current_page + 1
    
            page += `<button onClick = 'nextPage(${next}, ${data});'><i class="fas fa-angle-right"></i></button>`
    
            page += `<button onClick = 'nextPage(${length}, ${data});'><i class="fas fa-angle-double-right"></i></button>`
        }
    }

    $("#" + page_id + "-page").html(page)
}