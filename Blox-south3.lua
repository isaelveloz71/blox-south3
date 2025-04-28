-- Crear el menú personalizado para el juego South Bronx
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui

-- Función para crear el menú
local function createMenu()
    -- Crear un fondo para el menú
    local menuFrame = Instance.new("Frame")
    menuFrame.Size = UDim2.new(0.4, 0, 0.7, 0)
    menuFrame.Position = UDim2.new(0.3, 0, 0.15, 0)
    menuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    menuFrame.BorderSizePixel = 2
    menuFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
    menuFrame.Parent = ScreenGui

    -- Título del menú
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = "South Bronx Mod Menu"
    titleLabel.Size = UDim2.new(1, 0, 0.1, 0)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 24
    titleLabel.TextAlign = Enum.TextAlign.Center
    titleLabel.Parent = menuFrame

    -- Función para crear un botón con funcionalidad
    local function createButton(text, position, action)
        local button = Instance.new("TextButton")
        button.Text = text
        button.Size = UDim2.new(0.8, 0, 0.1, 0)
        button.Position = position
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.Gotham
        button.TextSize = 18
        button.BorderSizePixel = 0
        button.Parent = menuFrame

        -- Acción al presionar el botón
        button.MouseButton1Click:Connect(function()
            print(text .. " presionado")  -- Depuración
            action()
        end)

        -- Cambiar color al pasar el ratón sobre el botón
        button.MouseEnter:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        end)
        button.MouseLeave:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end)
    end

    -- Funciones para las acciones de los botones

    -- Acción de Autofarm NPCs
    local autofarmActive = false
    createButton("Autofarm NPCs", UDim2.new(0.1, 0, 0.15, 0), function()
        autofarmActive = not autofarmActive
        if autofarmActive then
            print("Autofarm NPCs activado")
            -- Aquí iniciamos el autofarm para los NPCs
            local npc = game.Workspace:FindFirstChild("NPC")  -- Reemplaza "NPC" con el nombre de tu NPC
            if npc then
                while autofarmActive do
                    if npc.Health > 0 then
                        npc:TakeDamage(10)  -- Daño constante a los NPCs
                    end
                    wait(1)
                end
            end
        else
            print("Autofarm NPCs desactivado")
        end
    end)

    -- Acción de Robo Automático
    local robberyActive = false
    createButton("Robo Automático", UDim2.new(0.1, 0, 0.3, 0), function()
        robberyActive = not robberyActive
        if robberyActive then
            print("Robo Automático activado")
            -- Aquí iniciamos el robo automático (puedes agregar más lógica, como robar objetos)
            local bank = game.Workspace:FindFirstChild("Bank")  -- Reemplaza con el nombre de tu banco
            if bank then
                -- Simular robo (esto es solo un ejemplo)
                local money = Instance.new("IntValue")
                money.Name = "Money"
                money.Value = 1000  -- La cantidad robada
                money.Parent = Player.Backpack
                print("Robo realizado con éxito")
            end
        else
            print("Robo Automático desactivado")
        end
    end)

    -- Acción de Autofarm Bolsa Mágica
    local magicBagActive = false
    createButton("Autofarm Bolsa Mágica", UDim2.new(0.1, 0, 0.45, 0), function()
        magicBagActive = not magicBagActive
        if magicBagActive then
            print("Autofarm Bolsa Mágica activado")
            -- Aquí iniciamos el autofarm de la bolsa mágica
            local magicBag = game.Workspace:FindFirstChild("MagicBag")  -- Reemplaza con el nombre de tu bolsa mágica
            if magicBag then
                while magicBagActive do
                    local bagClone = magicBag:Clone()
                    bagClone.Parent = Player.Backpack
                    print("Bolsa Mágica obtenida")
                    wait(5)  -- Espera 5 segundos antes de obtener la siguiente bolsa
                end
            end
        else
            print("Autofarm Bolsa Mágica desactivado")
        end
    end)

    -- Acción de Vender Bolsa Mágica
    local sellMagicBagActive = false
    createButton("Vender Bolsa Mágica", UDim2.new(0.1, 0, 0.6, 0), function()
        sellMagicBagActive = not sellMagicBagActive
        if sellMagicBagActive then
            print("Venta Bolsa Mágica activada")
            -- Aquí iniciamos la venta de la bolsa mágica
            local magicBag = Player.Backpack:FindFirstChild("MagicBag")  -- Buscar la bolsa en el inventario
            if magicBag then
                -- Vender la bolsa (esto es solo un ejemplo)
                magicBag:Destroy()
                local money = Instance.new("IntValue")
                money.Name = "Money"
                money.Value = 500  -- El valor por la venta de la bolsa
                money.Parent = Player.Backpack
                print("Bolsa mágica vendida y dinero agregado")
            end
        else
            print("Venta Bolsa Mágica desactivada")
        end
    end)

    -- Acción de Autotrabajo (para ganar dinero trabajando)
    local workActive = false
    createButton("Autotrabajo", UDim2.new(0.1, 0, 0.75, 0), function()
        workActive = not workActive
        if workActive then
            print("Autotrabajo activado")
            -- Aquí iniciamos el autotrabajo (esto es solo un ejemplo)
            while workActive do
                local item = game.Workspace:FindFirstChild("WorkItem")  -- Reemplaza con el nombre del item de trabajo
                if item then
                    -- Recolectar el item y darle dinero al jugador
                    local money = Instance.new("IntValue")
                    money.Name = "Money"
                    money.Value = 50  -- Dinero ganado por trabajo
                    money.Parent = Player.Backpack
                    item:Destroy()  -- Eliminar el item tras ser recogido
                    print("Dinero ganado por trabajo")
                end
                wait(5)  -- Espera 5 segundos antes de la siguiente tarea
            end
        else
            print("Autotrabajo desactivado")
        end
    end)
end

-- Crear el menú al iniciar
createMenu()
