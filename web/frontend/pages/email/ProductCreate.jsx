import {
    Card,
    Page,
    Layout,
    Form, 
    FormLayout, 
    Toast, 
    TextField, 
    Button,
    Frame
  } from "@shopify/polaris";
import { TitleBar } from "@shopify/app-bridge-react";
import { useAppQuery, useAuthenticatedFetch } from "../../hooks";
import {useState, useCallback} from 'react';



export default function ProductCreate() {
    const [isLoading, setIsLoading] = useState(true);
   
    const fetch = useAuthenticatedFetch();

    const emptyToastProps = { content: null };
    const [toastProps, setToastProps] = useState(emptyToastProps);
    const toastMarkup = toastProps.content?(
        <Toast {...toastProps} onDismiss={() => setToastProps(emptyToastProps)} />
    ):null;

    const [formData, setFormData] = useState({
        heading: '',//datas.data.heading,
        bodyContent: '',
    });

    const handleInputChange = (field) => (value) => {
        setFormData({ ...formData, [field]: value });
    };


   
    const handleSubmit = async () => {
        const response = await fetch("/api/product-create", {
            method:'POST',
            body: JSON.stringify(formData),
            headers: { "Content-Type": "application/json" },
        });
        
        if (response.ok) {
            setToastProps({
                content: 'Changes saved successfully',
                error: false,
            });
        }
    };
 
    return (
        
        <Frame>
        <Page>
        <TitleBar title="Create Product" />
        {toastMarkup}
        <Layout>
        <Layout.Section>
            <Card sectioned>
                <Form onSubmit={handleSubmit}>
                    <FormLayout>


                        <TextField
                            label="Heading"
                            value={formData.heading}
                            onChange={handleInputChange('heading')}
                            autoComplete="off"
                        />

                        <TextField
                            label="Body Content"
                            value={formData.bodyContent}
                            onChange={handleInputChange('bodyContent')}
                            multiline={5}
                            autoComplete="off"
                        />

                        <Button submit>Submit</Button>
                    </FormLayout>
                </Form>
            </Card>
        </Layout.Section>
        </Layout>
    </Page>
    </Frame>
    );
    
}
