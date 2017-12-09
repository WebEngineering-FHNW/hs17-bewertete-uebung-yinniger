<div>
    <label>${desc}</label>
    <select class="option-select" name="${name}">
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
