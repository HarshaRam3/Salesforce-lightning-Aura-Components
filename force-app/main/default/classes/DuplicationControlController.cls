public class DuplicationControlController {
    private static final String FIELD_SET_NAME = 'DuplicationControl';
    private List<Schema.FieldSetMember> getFields(SobjectType sobjType) {
            Map<String, Schema.FieldSet> fsMap = sobjType.getDescribe().FieldSets.getMap();
            return fsMap.get(FIELD_SET_NAME).getFields();
        }

        public List<Schema.FieldSetMember> getLeadFields() {
            return getFields(Lead.SobjectType);
        }
    }