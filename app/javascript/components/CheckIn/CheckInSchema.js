import * as Yup from 'yup';

const initialValues = { code: '' }

const FormCheckSchema = Yup.object({
  code: Yup.number()
  .typeError("The code is based on a string made up of numbers only.")
  .required("The code is required")
})

export { initialValues, FormCheckSchema }
