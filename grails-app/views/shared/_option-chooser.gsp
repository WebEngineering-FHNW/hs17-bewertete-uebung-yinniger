<div class="col-md-3 field">
    <div class="row field-description">
        <label>${desc}</label>
    </div>

    <div class="row field-input">
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
