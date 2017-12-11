<div class="row">
    <div class="col-md-1">
        <label>${desc}</label>
    </div>
    <div class="col-md-2">
        <select class="option-select" name="${name}">
            <g:if test="${selected.toString() == ""}">
                <option class="no-select" value="" selected disabled hidden>Choose language..</option>
            </g:if>
            <g:each var="option" in="${options}">
                <g:if test="${option.toString() == selected.toString()}">
                    <option value="${option}" selected>${option.toString()}</option>
                </g:if>
                <g:else>
                    <option value="${option}">${option.toString()}</option>
                </g:else>
            </g:each>
        </select>
    </div>
</div>
